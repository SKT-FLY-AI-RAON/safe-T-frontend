import 'dart:convert'; // JSON 인코딩을 위해 추가
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:io'; // SocketException 처리를 위해 추가

Future<void> publishJsonMessage(Map<String, dynamic> message) async {
  final String broker = '3.35.30.20'; // EC2 인스턴스 IP
  final int port = 1883;
  final String topic = 'obd/topic';

  // 고유한 클라이언트 식별자 생성 (최대 23자)
  String clientId = 'flutter_client_' + DateTime
      .now()
      .millisecondsSinceEpoch
      .toString();

  // MQTT 클라이언트 생성
  final client = MqttServerClient(broker, '');
  client.port = port;
  client.logging(on: true);

  // 자동 재연결 활성화
  client.autoReconnect = true;

  // 연결 설정
  client.connectionMessage = MqttConnectMessage()
      .withClientIdentifier(clientId)
      .withWillQos(MqttQos.atLeastOnce)
      .keepAliveFor(60)
      .startClean();
  client.connectTimeoutPeriod = 10000; // 10초로 타임아웃 시간 설정


  try {
    print('Attempting to connect to the broker at $broker...');
    await client.connect();

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected to the broker');

      // Dart 객체를 JSON 문자열로 변환
      String jsonString = jsonEncode(message);

      // 메시지를 UTF-8로 인코딩하여 발행
      final builder = MqttClientPayloadBuilder();
      builder.addUTF8String(jsonString);

      // 메시지 발행
      print('Publishing message to topic "$topic": $jsonString');
      client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);

      print('JSON message published successfully to topic "$topic"');
    } else {
      print('Failed to connect to the broker: ${client.connectionStatus}');
    }
  } on NoConnectionException catch (e) {
    print('No connection exception: $e');
  } on SocketException catch (e) {
    print('Socket exc');
  }
}