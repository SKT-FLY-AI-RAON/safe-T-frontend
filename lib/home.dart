import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'map_screen.dart'; // map_screen.dart 파일을 임포트합니다.

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                  ),
                ),
                // 4 박스 시작부분
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
                                  child: SizedBox(
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
                                              builder: (context) => const MapScreen(),

                                            ),
                                          );
                                        },
                                        child: Container(
                                          color: Colors.blue, // 박스의 색상
                                        ),
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
                                  child: SizedBox(),
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
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/Component_3.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                          onTap: () {
                            // 버튼 클릭 시 실행할 코드
                            print('Container 버튼 클릭됨');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 23,
                  child: SizedBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
