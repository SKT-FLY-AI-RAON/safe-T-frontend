import 'package:flutter/material.dart';
import 'package:raon_frontend/agreeScreen.dart';
import 'package:raon_frontend/cardPage.dart';
import 'package:raon_frontend/setting.dart';
import 'bluetooth.dart';
import 'mqtt/MqttTestScreen.dart';
import 'mqtt/mqttPublisherTestScreen.dart';
import 'map_screen.dart';
import 'streaming.dart';
import 'mqtt/mqttSubscriberTestScreen.dart';
import 'cardPage.dart';
import 'setting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatelessWidget {
  Home({super.key});

  final inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배경 이미지
        Scaffold(
          backgroundColor: Colors.white,
        ),
        SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFEFF0F4),
            body: Column(
              children: [
                // 상단바 구현
                Flexible(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 4, top: 10, bottom: 4),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const MapScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 15,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 10, top: 10, bottom: 10),
                              child: TextField(
                                cursorColor: Colors.black, // 커서 색상 설정
                                cursorWidth: 1.5, // 커서의 두께 설정 (옵션)
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  hintText: '어디로 갈까요?',
                                  hintStyle: TextStyle(
                                    color: Color(0x98D0D0D0),
                                  ),
                                  suffixIcon: Icon(Icons.mic),
                                  suffixIconColor: Colors.blueAccent,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.blue),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(color: Color(0x98505050)),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                icon: Icon(Icons.send),
                                iconSize: 25,
                                color: Colors.blue,
                                onPressed: () {
                                  print('IconButton pressed');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 상단 바 밑 구현
                Flexible(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(),
                              Icon(Icons.home, color: Colors.grey, size: 20),
                              Text('집', style: TextStyle(color: Colors.grey)),
                              Text('|'),
                              Icon(Icons.business,
                                  color: Colors.grey, size: 20),
                              Text('회사', style: TextStyle(color: Colors.grey)),
                              SizedBox(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.monetization_on, color: Colors.yellow),
                              Text(
                                '내 포인트',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('|'),
                              Text('무료적립'),
                              Icon(Icons.arrow_forward_ios_sharp,
                                  weight: 1.0, size: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 4개 박스 부분 시작부분
                Flexible(
                  flex: 38,
                  child: Container(
                    margin: EdgeInsets.only(top: 12), // 위쪽 마진 추가하여 간격 조정
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
                                        left: 15.0, right: 5, top: 5, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF6940F4),
                                            Color(0xFF2B5DF5),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Box(
                                        page: MapScreen(),
                                        tt: '내비',
                                        stt: '가장 빠르고 정확한 길안내',
                                        img: 'assets/car.png',
                                        col: Colors.transparent,
                                        subcol: 0xFFDCDCDC,
                                        fontcol: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                // 2번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 15, top: 5, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF314986),
                                            Color(0xFF223158),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Box(
                                        page: CardPage(),
                                        tt: '대중교통',
                                        stt: '버스, 지하철도 티맵에서',
                                        img: 'assets/bus.png',
                                        col: Colors.transparent,
                                        subcol: 0xFFDCDCDC,
                                        fontcol: Colors.white,
                                      ),
                                    ),
                                  ),
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 5, top: 5, bottom: 5),
                                    child: Box(
                                      page: MjpegStreamScreen(),
                                      tt: '주차',
                                      stt: '주차요금 할인받고 간편결제',
                                      img: 'assets/park.png',
                                      col: Colors.white,
                                      subcol: 0xFF7C7C7C,
                                      fontcol: Colors.black,
                                    ),
                                  ),
                                ),
                                // 4번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 15, top: 5, bottom: 5),
                                    child: Box(
                                      tt: '대리운전',
                                      stt: '할인도 적립도 티나게 좋다',
                                      img: 'assets/handle.png',
                                      col: Colors.white,
                                      fontcol: Colors.black,
                                      subcol: 0xFF7C7C7C,
                                      page: MqttTestScreen(),
                                    ),
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
                  flex: 15, // flex 값을 증가시켜 높이를 더 크게 설정
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Color(0xFFEB745E)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 0),
                    child: GestureDetector(
                      onTap: () async{
                        var agree;
                        var response = await http.get(Uri.parse('http://3.35.30.20:80/setting?userId=1'));
                        if (response.statusCode == 200) {
                          var decodedresponse = jsonDecode((utf8.decode(response.bodyBytes)));
                          agree = decodedresponse['data']['agreement'];
                        } else {
                          print('파일 전송 실패: 상태 코드 ${response.statusCode}');
                        }
                        // 추가 처리 필요
                        if(agree != true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => AgreeScreen(Id: 1),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => Setting(),
                            ),
                          );
                        }
                      },
                      child: Stack(
                        children:[
                          Align(
                            alignment: Alignment(-0.8,0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(),
                                Text('SAFE-T',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold)),
                                Text('도로 위 안전 운전을 위한 서비스',
                                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                                SizedBox(),
                              ],
                            ),
                          ),

                          Align(alignment:Alignment(1, 0),child: FractionallySizedBox(heightFactor:0.9,widthFactor: 0.3,child:Image.asset('assets/shadowIcon.png'))),
                        ],
                      ),
                    ),
                  ),
                ),
                // 완전 하단 시작
                Flexible(
                  flex: 35,
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(),
                        color: Colors.transparent
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SBox(picture: 'assets/rent.png'),
                                SBox(picture: 'assets/charge.png'),
                                SBox(picture: 'assets/bike.png'),
                                SBox(picture: 'assets/buycar.png'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, bottom: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SBox(picture: 'assets/airportbus.png'),
                                SBox(picture: 'assets/around.png'),
                                SBox(picture: 'assets/subway.png'),
                                SBox(picture: 'assets/taxi.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),

            // 하단바
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Color(0xFFB2B9C1),
              iconSize: 30, // 아이콘 크기 증가
              selectedLabelStyle: TextStyle(fontSize: 14), // 선택된 항목의 텍스트 크기 증가
              unselectedLabelStyle: TextStyle(fontSize: 12), // 선택되지 않은 항목의 텍스트 크기 증가
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'T지금'),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/carlife.png',
                    width: 30, // 아이콘 크기
                    height: 30, // 아이콘 크기
                    fit: BoxFit.contain, // 아이콘 크기 조정
                  ),
                  label: '카라이프',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/daeri.png',
                    width: 30, // 아이콘 크기
                    height: 30, // 아이콘 크기
                    fit: BoxFit.contain, // 아이콘 크기 조정
                  ),
                  label: '대리운전',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/entire.png',
                    width: 30, // 아이콘 크기
                    height: 30, // 아이콘 크기
                    fit: BoxFit.contain, // 아이콘 크기 조정
                  ),
                  label: '전체',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 4분할 박스 class
class Box extends StatelessWidget {
  const Box({
    super.key,
    this.tt,
    this.stt,
    this.img,
    this.page,
    this.col,
    this.fontcol,
    this.subcol,
  });

  final String? tt;
  final String? stt;
  final String? img;
  final Widget? page;
  final Color? col;
  final int? subcol;
  final Color? fontcol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 5, left: 0, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: col,
      ),
      child: GestureDetector(
        onTap: () {
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page!,
              ),
            );
          } else {
            print('NoPage');
          }
        },
        child: Stack(
          children: [
            ListTile(
              title: Text(
                tt!,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: fontcol,
                ),
              ),
              subtitle: Text(stt!,
                  style: TextStyle(fontSize: 11.8, color: Color(subcol!))),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(1.2, 0.8),
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 0.5,
                  child: Image.asset(
                    img!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SBox extends StatelessWidget {
  const SBox({
    super.key,
    this.picture,
    this.text,
    this.fontSize = 20.0, // 기본 글씨 크기 설정
    // this.imageSize = 90.0, // 기본 이미지 크기 설정
  });

  final String? picture;
  final String? text;
  final double fontSize; // 글씨 크기 기본값 추가
  // final double imageSize; // 이미지 크기 기본값 추가

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
              FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 1,
                child: Image.asset(
                  picture!,
                  fit:BoxFit.contain,

                ),
              ),
      ),
    );
  }
}
