import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

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
                            // decoration: BoxDecoration(
                            //   border: Border.all(),
                            // ),
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
                                          // 버튼이 클릭되었을 때 실행되는 코드
                                          print('Container 버튼 클릭됨');
                                        },
                                      ),
                                    ),
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(),
                                    // ),
                                  ),
                                ),
                                // 2번 박스
                                Expanded(
                                  child: SizedBox(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(),
                                      // ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            // decoration: BoxDecoration(
                            //   border: Border.all(),
                            // ),
                            child: Row(
                              children: [
                                // 3번 박스
                                Expanded(
                                  child: SizedBox(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(),
                                      // ),
                                      ),
                                ),
                                // 4번 박스
                                Expanded(
                                  child: SizedBox(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(),
                                      // ),
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
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/Component_3.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        GestureDetector(
                          onTap: () {
                            // 버튼이 클릭되었을 때 실행되는 코드
                            print('Container 버튼 클릭됨');
                          },
                        ),
                      ],
                    ),
                    // decoration: BoxDecoration(
                    //   border: Border.all(),
                    // ),
                  ),
                ),
                Flexible(
                  flex: 23,
                  child: SizedBox(
                      // decoration: BoxDecoration(
                      //   border: Border.all(),
                      // ),
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
