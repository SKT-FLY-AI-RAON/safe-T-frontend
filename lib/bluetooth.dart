import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';

import 'mqtt/mqtt_publisher.dart';

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  List<BluetoothDevice> pairedDevices = [];
  BluetoothConnection? connection;
  BluetoothDevice? selectedDevice;

  void checkPermissions() async {
    if (await Permission.bluetoothConnect.request().isGranted) {
      // 권한이 부여된 경우 페어링된 장치를 가져옵니다.
      getPairedDevices();
    } else {
      print("Bluetooth connect permission not granted.");
    }
  }

  @override
  void initState() {
    super.initState();
    checkPermissions();
    // generateCsvFile();
  }

  // 페어링된 장치를 가져오는 함수
  void getPairedDevices() async {

    List<BluetoothDevice> devices = [];
    try {
      devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      setState(() {
        pairedDevices = devices;
      });
    } catch (e) {
      print("Error fetching paired devices: $e");
    }
  }

  int rpm = 0;
  int speed = 0;
  int load = 0;
  int throttle = 0;
  int pedal = 0;
  int fuelSystemStatus = 0;
  // 받아온 데이터들의 값을 추출하여 출력하는 함수
  void parseRPMResponse(String response) {
    // 응답을 공백으로 분리하여 리스트로 만듭니다.
    List<String> parts = response.split(' ');
    if (response == '\r' || response == '\r\n')
      return;

    if (parts.length >= 3) {
      // 각 PID에 따라 처리
      if (parts[0] == "41") {
        switch (parts[1]) {
          case "0C": // 엔진 RPM
            setState(() {
              this.rpm = (int.parse(parts[2], radix: 16) * 256 +
                  int.parse(parts[3], radix: 16)) ~/ 4;
            });
            print('Engine RPM: $rpm');
            break;
          case "0D": // 차량 속도
            setState(() {
              this.speed = int.parse(parts[2], radix: 16);
            });
            print('Vehicle Speed: $speed km/h');
            break;
          case "04": // 엔진 부하
            setState(() {
              this.load = int.parse(parts[2], radix: 16) * 100 ~/ 255;
            });
            print('Engine Load: $load%');
            break;
          case "11": // 스로틀 위치
            setState(() {
              this.throttle = int.parse(parts[2], radix: 16) * 100 ~/ 255;
            });
            print('Throttle Position: $throttle%');
            break;
          case "49": // 가속 페달 위치
            setState(() {
              this.pedal = int.parse(parts[2], radix: 16) * 100 ~/ 255;
            });
            print('Accelerator Pedal Position: $pedal%');
            break;
          case "03": // 연료 시스템 상태
            setState(() {
              this.fuelSystemStatus = int.parse(parts[2], radix: 16);
            });
            print('Fuel System Status: $fuelSystemStatus');
            break;
          default:
            print("Unknown PID");
        }
      }
    } else {
      print("Invalid response format");
    }
  }

  // 계속해서 request를 받아오는 함수
  StreamSubscription? subscription;
  void startListeningToOBD() {
    if (connection != null && subscription == null) {
      // 스트림 구독이 없을 때만 listen을 시작합니다.
      subscription = connection!.input!.listen(
            (data) {
          String response = utf8.decode(data);
          print(response);
          parseRPMResponse(response);
        },
        onDone: () {
          print('Disconnected from OBD-II scanner');
          subscription = null; // 스트림이 종료되면 구독을 해제합니다.
        },
        onError: (error) {
          print('Error: $error');
          subscription = null; // 에러 발생 시 구독을 해제합니다.
        },
        cancelOnError: true,
      );
    }
  }

  // command로 인한 데이터 요청하는 함수
  Future<void> sendOBDCommand(String command) async {
    if (connection != null) {
      // OBD-II 명령어를 ECU에 전달
      connection!.output.add(utf8.encode(command + "\r"));
      await connection!.output.allSent;  // 전송이 완료될 때까지 대기
      startListeningToOBD();
    }
  }


  // 실제로 데이터를 요청시키는 함수를 호출하는 함수 -> MQTT로 발행
  Future<void> requestAllData() async{
    await sendOBDCommand("010C");  // 엔진 RPM 요청
    await Future.delayed(Duration(milliseconds: 100));
    await sendOBDCommand("010D");  // 차량 속도 요청
    await Future.delayed(Duration(milliseconds: 100));
    await sendOBDCommand("0104"); // 엔진 부하
    await Future.delayed(Duration(milliseconds: 100));
    await sendOBDCommand("0111"); // 스로틀 위치
    await Future.delayed(Duration(milliseconds: 100));
    await sendOBDCommand("0149"); // 가속 페달 위치
    await Future.delayed(Duration(milliseconds: 100));
    await sendOBDCommand("0103"); // 연료 시스템 상태
    await Future.delayed(Duration(milliseconds: 100));

    // 데이터를 리스트로 수집
    List<String> data1 = [
      DateTime.now().toString(),  // 시간
      rpm.toString(),             // 엔진 RPM
      speed.toString(),           // 차량 속도
      load.toString(),            // 엔진 부하
      throttle.toString(),         // 스로틀 위치
      pedal.toString(),           // 가속 페달 위치
      fuelSystemStatus.toString(), // 연료 시스템 상태
    ];

    // 데이터 매핑: time, rpm, speed, load, throttle, pedal, fuelSystemStatus
    Map<String, dynamic> jsonData = {
      'time': data1[0],
      'rpm': data1[1],
      'speed': data1[2],
      'load': data1[3],
      'throttle': data1[4],
      'pedal': data1[5],
      'fuelSystemStatus': data1[6],
    };

    // JSON으로 변환 후 MQTT 발행
    await publishJsonMessage(jsonData);

    // CSV 파일에 데이터 추가
    await appendCsvRow(data1);
  }

  Future<void> appendCsvRow(List<dynamic> newRow) async {
    // CSV 파일 경로 설정
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/OBD_data.csv';

    // CSV 파일에 행 추가
    final file = File(path).openWrite(mode: FileMode.append);
    final row = '\n' + newRow.join(',');
    file.write(row);
    await file.close();
    final fileContent = await File(path).readAsString();

  }

  Timer? sendTimer;

  // 장치에 연결하는 함수 + 연결하자마자 바로 데이터 1초마다 불러오기
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      connection = await BluetoothConnection.toAddress(device.address);
      print('Connected to the device ${device.name}');
      setState(() {
        selectedDevice = device;
      });

      // 1초마다 데이터 받아오기
      sendTimer = Timer.periodic(Duration(milliseconds: 800), (timer) async{
        await requestAllData(); // 엔진 RPM 요청
      });
      // OBD-II 명령어 전송 (예: 엔진 RPM 요청)
    } catch (e) {
      print('Error connecting to the device: $e');
    }
  }

  // csv api 호출해서 보내기
  var responseMessage;
  Future<void> sendCsvFile() async {
    // CSV 파일 경로 가져오기
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/OBD_data.csv';
    final file = File(path);

    // 파일이 존재하는지 확인
    if (!await file.exists()) {
      print('CSV 파일이 존재하지 않습니다: $path');
      return;
    }

    // 서버에 전송할 URL
    final url = Uri.parse('http://3.35.30.20:80/test/image');

    // MultipartRequest를 사용하여 파일 전송
    var request = http.MultipartRequest('POST', url);
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

    // 파일 추가
    request.files.add(
      await http.MultipartFile.fromPath(
        'images', // 서버에서 파일을 받을 때 사용되는 이름
        path,
      ),
    );

    try {
      // 요청 전송 및 응답 처리
      final response = await request.send();

      if (response.statusCode == 200) {
        print('파일 전송 성공');
        final responseData = await response.stream.bytesToString();
        print('서버 응답: $responseData');
      } else {
        print('파일 전송 실패: 상태 코드 ${response.statusCode}');
      }
    } catch (e) {
      print('파일 전송 중 오류 발생: $e');
    }
  }

  List<List<dynamic>> data = [
    ['time','RPM', 'Speed', 'Load', 'ThrottlePos','PedalPos','FuelStatus'],
  ];
  // 데이터 csv 로 변환
  // Future<void> generateCsvFile() async {
  //   // 데이터 준비
  //
  //   // CSV 형식으로 변환
  //   String csvData = const ListToCsvConverter().convert(data);
  //
  //   // 파일 저장 경로 가져오기
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = '${directory.path}/OBD_data.csv';
  //
  //   // 파일 저장
  //   final file = File(path);
  //   await file.writeAsString(csvData);
  //
  //   print('CSV 파일이 저장되었습니다: $path');
  // }
  @override
  void dispose() {
    connection?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Paired Bluetooth Devices'),
          actions:[
            IconButton(
              icon:Icon(Icons.select_all),
              onPressed: () async {
                await sendCsvFile();
              },)
          ]
      ),
      body: ListView.builder(
        itemCount: pairedDevices.length,
        itemBuilder: (context, index) {
          BluetoothDevice device = pairedDevices[index];
          return ListTile(
            title: Text(device.name ?? 'Unknown Device'),
            subtitle: Text(device.address.toString()),
            trailing: device == selectedDevice
                ? Icon(Icons.bluetooth_connected, color: Colors.blue)
                : null,
            onTap: () {
              connectToDevice(device);
            },
          );
        },
      ),
    );
  }
}


