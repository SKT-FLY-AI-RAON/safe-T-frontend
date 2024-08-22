import 'package:flutter/material.dart';
import 'boramae.dart';
import 'map_screen.dart';

class firstscreen extends StatelessWidget {
  const firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // // 상태바 배경을 하얗게, 아이콘을 검정색으로 설정
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white, // 상태바 배경색을 흰색으로 설정
    //   statusBarIconBrightness: Brightness.dark, // 상태바 아이콘 색상을 검정색으로 설정
    //   statusBarBrightness: Brightness.light, // iOS용 (밝은 상태바는 검정 아이콘을 의미)
    // ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              'assets/selectScreen.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width, // 너비를 화면 너비로 설정
              fit: BoxFit.fill,
              // width:MediaQuery.of(context).size.height,

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
                                  margin: EdgeInsets.only(bottom: 10.0), // 하단에 10.0의 여백을 추가
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

                                // Divider(),
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
                                      Divider(height: 1, color: Color(0xFFBEBEBE),)
                                      , // 가로선과 세로선이 맞닿도록 높이 설정
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white, // 배경색 설정
                                        ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => boramae()),
                                                      );
                                                    },
                                                    child: Text(
                                                      'SKT 타워',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // 세로선 추가 (중앙 정렬)
                                              Container(
                                                width: 1, // 세로선의 두께
                                                height: 40, // 세로선의 높이를 가로선과 맞추기 위해 설정
                                                color: Color(0xFFBEBEBE), // 세로선 색상
                                                margin: EdgeInsets.symmetric(horizontal: 30.0), // 텍스트와 아이콘 사이의 여백
                                              ),
                                              // Icon(Icons.location_pin),
                                              Expanded(
                                                child: IgnorePointer(
                                                  child: Text(textAlign: TextAlign.end,
                                                    'SKT 보라매',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
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

