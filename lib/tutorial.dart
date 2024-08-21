// import 'package:flutter/material.dart';
//
// class tutorial extends StatefulWidget {
//   @override
//   _tutorialState createState() => _tutorialState();
// }
//
// class _tutorialState extends State<tutorial> {
//   PageController _pageController = PageController();
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: SizedBox(),
//         backgroundColor: Colors.white,
//       ),
//       body: PageView(
//         controller: _pageController,
//         children: <Widget>[
//           // 1번 페이지
//           Container(
//             color: Colors.white,
//             child: ListView(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     padding: EdgeInsets.only(top: 70),
//                     child: Image.asset('assets/Camera.png', fit: BoxFit.contain),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     '페달 블랙박스\n설치 튜토리얼',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 36,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     '차량이 비정상적인 속도를 감지하면\n블랙박스가 자동으로 작동하여\n사용자가 밟고 있는 페달 상태를 기록해 줍니다.\n페달 오조작으로 인한 사고 피해를 예방합시다!',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Image.asset('assets/tutorialPage1.png'),
//                 GestureDetector(
//                   onTap: () {
//                     _pageController.nextPage(
//                       duration: Duration(milliseconds: 100),
//                       curve: Curves.easeIn,
//                     );
//                   },
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
//                     child: Center(
//                       child: Text(
//                         '다음',
//                         style: TextStyle(fontSize: 24, color: Colors.white),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // 2번 페이지
//           Container(
//             color: Colors.white,
//             child: ListView(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     padding: EdgeInsets.only(top: 0),
//                     child: Image.asset('assets/pedal.png', fit: BoxFit.contain),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     '페달 블랙박스\n이렇게 설치하세요',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 36,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     '차량의 페달 왼쪽 측면에 블랙박스를 설치하고\n각도를 정확히 맞춰서\n운전자의 발과 페달 동작이 잘 보이도록 설정하세요.\n',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     padding: EdgeInsets.only(top: 50),
//                     child: Image.asset('assets/realPedal.png', fit: BoxFit.contain),
//                   ),
//                 ),
//                 Image.asset('assets/tutorialPage2.png'),
//                 GestureDetector(
//                   onTap: () {
//                     _pageController.nextPage(
//                       duration: Duration(milliseconds: 100),
//                       curve: Curves.easeIn,
//                     );
//                   },
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
//                     child: Center(
//                       child: Text(
//                         '다음',
//                         style: TextStyle(fontSize: 24, color: Colors.white),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // 3번 페이지
//           Container(
//             color: Colors.white,
//             child: ListView(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     padding: EdgeInsets.only(top: 70),
//                     child: Image.asset('assets/Money.png', fit: BoxFit.contain),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10, left: 40.0, right: 40.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     '페달 블랙박스\n설치해서 보험료 할인받고\n운전점수 획득하자!',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 30,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50.0),
//                   child: Text(
//                     textAlign: TextAlign.center,
//                     '페달 블랙박스를 설정하면 보험료 할인을 받을 수 있으며,\nTMAP 운전 점수와 연계해 추가 혜택을 누릴 수 있습니다.',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Image.asset('assets/tutorialPage3.png'),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                     // 페이지 이동 추가 필요시 여기에 추가
//                   },
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
//                     child: Center(
//                       child: Text(
//                         'SAFE-T 서비스 시작하기',
//                         style: TextStyle(fontSize: 24, color: Colors.white),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int currentPage = 0; // 현재 페이지를 추적하는 변수

  void nextPage() {
    setState(() {
      if (currentPage < 2) {
        currentPage++;
      } else {
        Navigator.pop(context); // 마지막 페이지에서 나가기
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading:currentPage == 0 ? SizedBox() :IconButton(icon:Icon(Icons.arrow_back),onPressed:(){
          setState(() {
            if (currentPage>0)
              currentPage--;
          });
        },),
      ),
      body: currentPage == 0
          ? buildPage1()
          : currentPage == 1
          ? buildPage2()
          : buildPage3(),
    );
  }

  //1번 화면
  Widget buildPage1() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [

          //카메라
          Padding(
            padding: EdgeInsets.only(top: 30), // 상단 패딩을 설정
            child: Container(
              width: double.infinity, // 부모 위젯의 너비를 명확히 설정
              height: MediaQuery.of(context).size.height * 0.25, // 부모 위젯의 높이를 더 줄임
              child: Align(
                alignment: Alignment.center, // 이미지가 중앙에 배치되도록 설정
                child: Image.asset('assets/Camera.png', fit: BoxFit.contain),
              ),
            ),
          ),

          //제목
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0), // 상단 패딩을 10으로 설정하여 제목과 카메라 이미지를 더 가깝게
            child: Text(
              textAlign: TextAlign.center,
              '페달 블랙박스\n설치 튜토리얼',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),

          //내용
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50.0, right: 50.0),
            child: Text(
              textAlign: TextAlign.center,
              '차량이 비정상적인 속도를 감지하면\n블랙박스가 자동으로 작동하여\n사용자가 밟고 있는 페달 상태를 기록해 줍니다.\n페달 오조작으로 인한 사고 피해를 예방합시다!',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),

          // 추가 이미지
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30), // 상하단 패딩을 추가하여 이미지와 컨텐츠 간의 여백 추가
            child: Image.asset('assets/tutorialPage1.png'),
          ),

          GestureDetector(
            onTap: nextPage,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              child: Center(
                child: Text(
                  '다음',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2962F7),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }




  //2번 화면
  Widget buildPage2() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          //이미지
          Padding(
            padding: EdgeInsets.only(top: 30), // 상단 패딩을 설정
            child: Container(
              width: double.infinity, // 부모 위젯의 너비를 명확히 설정
              height: MediaQuery.of(context).size.height * 0.25, // 부모 위젯의 높이를 더 줄임
              child: Align(
                alignment: Alignment.center, // 이미지가 중앙에 배치되도록 설정
                child: Image.asset('assets/pedal.png', fit: BoxFit.contain),
              ),
            ),
          ),

          // 제목 텍스트
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0), // 텍스트 상단에 여백을 조정하여 디자인 통일성 확보
            child: Text(
              textAlign: TextAlign.center,
              '페달 블랙박스\n이렇게 설치하세요!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),


          // 설명 텍스트
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30), // 패딩을 조정하여 여백 통일
            child: Text(
              textAlign: TextAlign.center,
              '차량의 페달 왼쪽에 블랙박스를 설치하고\n아래와 같은 각도로 맞춰서\n발과 페달 동작이 잘 보이도록 조정하세요',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),


          //이미지
          Padding(
            padding: EdgeInsets.only(top: 5), // 상단 패딩을 설정
            child: Container(
              width: double.infinity, // 부모 위젯의 너비를 명확히 설정
              height: MediaQuery.of(context).size.height * 0.2, // 부모 위젯의 높이를 더 줄임
              child: Align(
                alignment: Alignment.center, // 이미지가 중앙에 배치되도록 설정
                child: Image.asset('assets/realPedal.png', fit: BoxFit.contain),
              ),
            ),
          ),


          Image.asset('assets/tutorialPage2.png'),

          GestureDetector(
            onTap: nextPage,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: Center(
                child: Text(
                  '다음',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2962F7),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }


  //3번 화면
  Widget buildPage3() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [


          //이미지
          Padding(
            padding: EdgeInsets.only(top: 30), // 상단 패딩을 설정
            child: Container(
              width: double.infinity, // 부모 위젯의 너비를 명확히 설정
              height: MediaQuery.of(context).size.height * 0.25, // 부모 위젯의 높이를 더 줄임
              child: Align(
                alignment: Alignment.center, // 이미지가 중앙에 배치되도록 설정
                child: Image.asset('assets/Money.png', fit: BoxFit.contain),
              ),
            ),
          ),

          // 제목 텍스트
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0), // 텍스트 상단에 여백을 조정하여 디자인 통일성 확보
            child: Text(
              textAlign: TextAlign.center,
              '페달 블랙박스 설치해서\n보험료 할인받고\n운전점수 올리자!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),

          // 설명 텍스트
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30), // 패딩을 조정하여 여백 통일
            child: Text(
              textAlign: TextAlign.center,
              '페달 블랙박스를 설치하면\n보험료 할인을 받을 수 있으며\nTMAP 운전 점수와 연계해서\n추가 혜택을 누릴 수 있습니다.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),

          // 추가 이미지
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30), // 상하단 패딩을 추가하여 이미지와 컨텐츠 간의 여백 추가
            child: Image.asset('assets/tutorialPage3.png'),
          ),

          // 버튼
          GestureDetector(
            onTap: nextPage,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20), // 좌우 및 상하단 마진 통일
              child: Center(
                child: Text(
                  'SAFE-T 서비스 시작하기',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), // 글씨 굵기를 추가하여 버튼 강조
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2962F7),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

