import 'package:flutter/material.dart';
import 'package:raon_frontend/setting.dart';
import 'bluetooth.dart';
import 'mqtt_test_screen.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
                  TextButton(
                    child: Text(''),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(50, 50)),
                      shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder(), // 원형 버튼
                      ),
                      overlayColor: MaterialStateProperty.all(
                          Colors.transparent), // 물결 효과 없애기
                    ),
                    onPressed: () {
                      print('hi');
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
                                          print('Container 버튼 클릭됨');
                                        },
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
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 12, left: 12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => setting(),
                                ),
                              );
                            },
                          ),
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
