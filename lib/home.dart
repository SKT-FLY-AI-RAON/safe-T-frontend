import 'package:flutter/material.dart';
import 'package:raon_frontend/setting.dart';
import 'bluetooth.dart';
import 'mqtt/mqtt_publisher_test_screen.dart';
import 'map_screen.dart';
import 'mqtt/mqtt_subscriber_test_screen.dart'; // map_screen.dart 파일을 임포트합니다.

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
            // body: Image.asset(
            //   'assets/home.png',
            //   width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.cover,
            // ),
          ),

        SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFF5F5FA),
            //(0xFFEEEEF3),
            body: Column(
              children: [
                // 상단바 구현
                Flexible(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                    //     border: Border.all(),
                        color:Colors.white
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Row(
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
                                  // 패딩 조절
                                  hintText: '어디로 갈까요?',
                                  hintStyle: TextStyle(
                                    color: Color(0x98D0D0D0),
                                  ),
                                  suffixIcon: Icon(Icons.mic),
                                  suffixIconColor: Colors.blueAccent,
                                  // border: OutlineInputBorder(
                                  //     borderSide: BorderSide(color: Colors.black),
                                  //     borderRadius: BorderRadius.circular(50)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.blue), // 비활성화 상태의 테두리 색상
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.blue), // 포커스 상태의 테두리 색상
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 화살표 버튼
                          Flexible(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),

                                border: Border.all(color: Color(0x98505050)),
                                shape: BoxShape.circle, // 아이콘을 원형으로 감싸기 위해
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(3, 3), // 그림자의 위치 조정

                          Expanded(
                            child: SizedBox(
                              child: Row(
                                children: [
                                  // 3번 박스
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (c) =>
                                                MqttSubscriberTestScreen(),
                                          ),
                                        );
                                      },
                                    ),
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
                    width: double.infinity, height: double.infinity,
                    // color: Colors.transparent,
                    decoration: BoxDecoration(
                        // border: Border.all(),
                        color:Colors.white
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
                              SizedBox(),
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
                    decoration: BoxDecoration(
                        // border: Border.all(),
                    ),
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
                                      page: BottomSheetExample(),
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
                                      page: HorizontalScrollableCards(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => setting(),
                          ),
                        );
                      },
                      child: ListTile(
                        // contentPadding: EdgeInsets.zero,
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
                        // border: Border.all(),
                        color:Colors.transparent
                    ),
                    child:Column(
                      children:[
                        Expanded(
                          child: Container(
                            margin:EdgeInsets.all(10),
                            // decoration: BoxDecoration(
                            //     border: Border.all(),
                            //     color:Colors.transparent
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SBox(picture:'assets/rent.png'),
                                SBox(picture:'assets/charge.png'),
                                SBox(picture:'assets/bike.png'),
                                SBox(picture:'assets/buycar.png'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:EdgeInsets.all(10),
                            // decoration: BoxDecoration(
                            //     border: Border.all(),
                            //     color:Colors.transparent
                            // ),
                            child: Row(
                              children: [
                                SBox(picture:'assets/airportbus.png'),
                                SBox(picture:'assets/around.png'),
                                SBox(picture:'assets/subway.png'),
                                SBox(picture:'assets/taxi.png'),
                              ],
                            ),
                          ),
                        ),
                      ]
                    )
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on), label: 'T지금'),
                BottomNavigationBarItem(
                    icon: SizedBox(height:24,width:24,child:Image.asset('assets/carlife.png')), label: '카라이프'),
                BottomNavigationBarItem(
                    icon: SizedBox(height:24,width:24,child:Image.asset('assets/daeri.png')), label: '대리운전'),
                BottomNavigationBarItem(
                    icon: SizedBox(height:24,width:24,child:Image.asset('assets/entire.png')), label: '전체'),
              ],
            ),
            floatingActionButton: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // 그림자 색상
                    spreadRadius: 1, // 그림자 확산 정도
                    blurRadius: 3, // 그림자 흐림 정도
                    offset: Offset(1, 2), // 그림자의 위치 (x, y)
                  ),
                ],
                color:Colors.white,
                shape:BoxShape.circle,
                border:Border.all(width:2.5,color:Color(0xFFE0A4A4)),
                // borderRadius: BorderRadius.circular(30),
              ),width:60,height:60,
              child:GestureDetector(
                child: FractionallySizedBox(
                  widthFactor: 0.8, // 부모의 80% 크기
                  heightFactor: 0.8, // 부모의 80% 크기
                  child: Image.asset(
                    'assets/Frame_5005.png', // 여기에 이미지를 넣으세요
                    fit: BoxFit.contain,
                  ),
                ),onTap: (){

                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Box extends StatelessWidget {
  const Box(
      {super.key,
      this.tt,
      this.stt,
      this.img,
      this.page,
      this.col,
      this.fontcol,
      this.subcol});

  final tt;
  final stt;
  final img;
  final page;
  final col;
  final subcol;
  final fontcol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 15),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: col),
      child: GestureDetector(
        onTap: () {
          // 1번 박스 클릭 시 MapScreen으로 이동
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          } else {
            print('NoPage');
          }
        },
        child: Stack(
          children: [
            ListTile(
              // contentPadding: EdgeInsets.zero,
              title: Text(
                tt,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: fontcol,
                ),
              ),
              subtitle: Text(stt,
                  style: TextStyle(fontSize: 14, color: Color(subcol))),
              // trailing: Image.asset('assets/Frame_5005.png'),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(1.0, 0.8),
                child: FractionallySizedBox(
                  widthFactor: 0.5, // 부모의 20% 크기
                  heightFactor: 0.5, // 부모의 20% 크기
                  child: Image.asset(
                    img, // 여기에 이미지를 넣으세요
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
  const SBox({super.key,this.picture});
  final picture;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin:EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Image.asset(picture)),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Sheet Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.5, // 초기 크기 (화면 높이의 50%)
                  minChildSize: 0.5, // 최소 크기 (화면 높이의 30%)
                  maxChildSize: 1, // 최대 크기 (화면 높이의 80%)
                  builder: (BuildContext context, ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 작대기 추가
                            GestureDetector(
                              onVerticalDragUpdate: (details) {
                                scrollController.position.jumpTo(
                                  scrollController.position.pixels - details.primaryDelta!,
                                );
                              },
                              child: Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '즐겨찾기',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              title: Text('최근 목적지'),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            ListTile(
                              title: Text('SKT 타워'),
                              trailing: Icon(Icons.location_pin),
                            ),
                            // 여기에 추가 항목을 넣을 수 있습니다.
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Text('Show Bottom Sheet'),
        ),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              // 지도 같은 다른 콘텐츠가 들어갈 수 있는 영역
              color: Colors.grey[300],
              child: Center(child: Text('지도 영역')),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 200.0, // 카드들의 높이 설정
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildCard('티맵추천', '37분', '오후 4:26 도착', '13km', '통행료 없음'),
                buildCard('최소시간', '37분', '오후 4:26 도착', '13km', '통행료 없음'),
                buildCard('무료도로', '44분', '오후 4:33 도착', '13km', '통행료 없음'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            // child: ElevatedButton(
            //   onPressed: () {
            //     // 안내시작 버튼 동작
            //   },
            //   child: Text('안내시작'),
            // ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String time, String arrival, String distance, String toll) {
    return Container(
      width: 150.0,
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
            style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            time,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            arrival,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 8.0),
          Text(
            distance,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            toll,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Spacer(),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: TextButton(
          //     onPressed: () {},
          //     child: Text('상세'),
          //   ),
          // ),
        ],
      ),
    );
  }
}