import 'package:flutter/material.dart';
import 'boramae.dart';
import 'map_screen.dart';

class firstscreen extends StatelessWidget {
  const firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
            Image.asset(
              height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.height,
              'assets/firstscreen.png',fit:BoxFit.fill,
            ),
            DraggableScrollableSheet(
              // expand: false, // 화면 공간 차지와 비율
              initialChildSize: 0.4, // 초기 크기 (화면 높이의 40%)
              minChildSize: 0.1, // 최소 크기 (화면 높이의 10%)
              maxChildSize: 0.8, // 최대 크기 (화면 높이의 80%)
              builder: (BuildContext context, ScrollController scrollController) {
                return Material(
                  // 이 Material 위젯을 추가
                  elevation: 4,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Color(0xFFF5F5F5),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 작대기 추가
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Color(0xFFBEBEBE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onVerticalDragUpdate: (details) {
                              scrollController.position.jumpTo(
                                scrollController.position.pixels -
                                    details.primaryDelta!,
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      '즐겨찾기',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                                Divider(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('최근 목적지'),
                                        trailing: Icon(Icons.arrow_forward_ios),
                                        onTap: () {
                                          // 추가 기능 구현
                                        },
                                      ),
                                      ListTile(
                                        title: Text('SKT 타워'),
                                        trailing: Icon(Icons.location_pin),
                                        onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => boramae()),
                                            );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

