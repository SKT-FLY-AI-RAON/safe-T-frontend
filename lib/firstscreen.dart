import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 시스템 UI 스타일 변경을 위해 필요
import 'boramae.dart';
import 'map_screen.dart';

class firstscreen extends StatelessWidget {
  const firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 상태바 배경을 하얗게, 아이콘을 검정색으로 설정
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // 상태바 배경색을 흰색으로 설정
      statusBarIconBrightness: Brightness.dark, // 상태바 아이콘 색상을 검정색으로 설정
      statusBarBrightness: Brightness.light, // iOS용 (밝은 상태바는 검정 아이콘을 의미)
    ));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/firstscreen.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width, // 너비를 화면 너비로 설정
              fit: BoxFit.fill,
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4, // 초기 크기 (화면 높이의 40%)
              minChildSize: 0.1, // 최소 크기 (화면 높이의 10%)
              maxChildSize: 0.8, // 최대 크기 (화면 높이의 80%)
              builder: (BuildContext context, ScrollController scrollController) {
                return Material(
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
                          // 드래그바 추가
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
