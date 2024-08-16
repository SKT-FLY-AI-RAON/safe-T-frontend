import 'package:flutter/material.dart';
import 'package:raon_frontend/setting.dart';
import 'bluetooth.dart';
import 'mqtt_test_screen.dart';
import 'map_screen.dart'; // map_screen.dart 파일을 임포트합니다.

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // 배경 이미지
            Image.asset(
              'assets/home.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.send),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => BluetoothScreen(),
                    ),
                  );
                },
              ),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      print('Send button pressed');
                    },
                  ),
                  TextButton(
                    child: Text(''),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(50, 50)),
                      shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder(),
                      ),
                      overlayColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      print('TextButton pressed');
                    },
                  ),
                  SizedBox(width: 8),
                ],
              ),
              body: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(),
                  ),
                  // 4개 박스 부분 시작부분
                  Flexible(
                    flex: 18,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Row(
                                children: [
                                  // 1번 박스
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 4,
                                          top: 10,
                                          bottom: 4),
                                      child: GestureDetector(
                                        onTap: () {
                                          // 1번 박스 클릭 시 MapScreen으로 이동
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                              const MapScreen(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          color: Colors.blue, // 박스의 색상
                                        ),
                                      ),
                                    ),
                                  ),
                                  // 2번 박스
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Row(
                                children: [
                                  // 3번 박스
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  // 4번 박스
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (c) =>
                                                MqttTestScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 메인 서비스 루트 시작
                  Flexible(
                    flex: 5,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/main_service_root.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => setting(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 23,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
