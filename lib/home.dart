import 'package:flutter/material.dart';
import 'package:raon_frontend/agreeScreen.dart';
import 'package:raon_frontend/setting.dart';
import 'bluetooth.dart';
import 'mqtt/MqttTestScreen.dart';
import 'mqtt/mqttPublisherTestScreen.dart';
import 'map_screen.dart';
import 'streaming.dart';
import 'mqtt/mqttSubscriberTestScreen.dart';

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
            backgroundColor: Color(0xFFF5F5FA),
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
                                          right: 5,
                                          top: 10,
                                          bottom: 5),
                                      child: Box(
                                        page:MapScreen(),
                                        tt: '내비',
                                        stt: '가장 빠르고 정확한 길안내',
                                        img: 'assets/car.png',
                                        col: Colors.blueAccent,
                                        subcol: 0xFFDCDCDC,
                                        fontcol: Colors.white,
                                      )),
                                ),
                                // 2번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0,
                                        right: 15,
                                        top: 10,
                                        bottom: 5),
                                    child: Box(
                                      page: MyHomePage(),
                                      tt: '대중교통',
                                      stt: '버스, 지하철도 티맵에서',
                                      img: 'assets/bus.png',
                                      col: Colors.indigo,
                                      subcol: 0xFFDCDCDC,
                                      fontcol: Colors.white,
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
                                        left: 15.0,
                                        right: 5,
                                        top: 5,
                                        bottom: 10),
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
                                        left: 5.0,
                                        right: 15,
                                        top: 5,
                                        bottom: 10),
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
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE0A4A4)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(right: 15, left: 15),
                    child: GestureDetector(
                      onTap: () {
                        // 추가 처리 필요
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => AgreeScreen(),
                            ),
                          );
                      },
                      child: ListTile(
                        title: Text('SAFT-T',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text('도로 위 안전 운전을 위한 서비스',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        trailing: Image.asset('assets/shadowIcon.png'),
                      ),
                    ),
                  ),
                ),
                // 완전 하단 시작
                Flexible(
                  flex: 35,
                  child: Container(
                    decoration: BoxDecoration(
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
                                // GestureDetector(onTap:(){Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     // builder: (c) => VideoStreamScreen(),
                                //   ),
                                // );},
                                //     child:
                                    SBox(picture: 'assets/rent.png'),
                                // ),
                                SBox(picture: 'assets/charge.png'),
                                SBox(picture: 'assets/bike.png'),
                                SBox(picture: 'assets/buycar.png'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
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
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on), label: 'T지금'),
                BottomNavigationBarItem(
                    icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset('assets/carlife.png')),
                    label: '카라이프'),
                BottomNavigationBarItem(
                    icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset('assets/daeri.png')),
                    label: '대리운전'),
                BottomNavigationBarItem(
                    icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset('assets/entire.png')),
                    label: '전체'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
      padding: EdgeInsets.only(top: 15),
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: fontcol,
                ),
              ),
              subtitle: Text(stt!,
                  style: TextStyle(fontSize: 14, color: Color(subcol!))),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(1.0, 0.8),
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
  const SBox({super.key, this.picture});
  final String? picture;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Image.asset(picture!)),
      ),
    );
  }
}

class HorizontalScrollableCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal Scrollable Cards'),
      ),
      body: Stack(
        children: [
          Container(
              color: Colors.grey[300],
              child: Center(child: Text('지도 영역')),
          ),

              Align(
                alignment: Alignment(0.5,0.8),
                child: Container(
                  color:Colors.transparent,
                  padding: EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height * 0.2, // 20%,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      buildCard('티맵추천', '37분', '오후 4:26 도착', '13km', '통행료 없음',context),
                      buildCard('최소시간', '37분', '오후 4:26 도착', '13km', '통행료 없음',context),
                      buildCard('무료도로', '44분', '오후 4:33 도착', '13km', '통행료 없음',context),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 1),
                child: GestureDetector(
                  onTap:(){print('hi');},
                  child: Container(
                    margin:EdgeInsets.all(15),
                    width:double.infinity,
                    height:MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(color:Color(0xFF2B6AFF),borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text(style: TextStyle(color:Colors.white),'안내시작')),
                  ),
                ),
              ),

        ],
      ),
    );
  }

  Widget buildCard(String title, String time, String arrival, String distance, String toll, context) {
    return GestureDetector(
      onTap: (){
        print('hi');
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              arrival,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              distance,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              toll,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map App Example')),
      body: Stack(
        children: [
          // 지도와 같은 메인 콘텐츠
          Container(
            color: Colors.green[200],
            child: Center(child: TextButton(child:Text('Text'),onPressed: (){print('hi');},)),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3, // 초기 시트 크기 (30% 화면 높이)
            minChildSize: 0.1, // 최소 시트 크기
            maxChildSize: 0.7, // 최대 시트 크기
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.white,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}