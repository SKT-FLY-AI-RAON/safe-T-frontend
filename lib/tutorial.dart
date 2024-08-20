import 'package:flutter/material.dart';

class tutorial extends StatefulWidget {
  @override
  _tutorialState createState() => _tutorialState();
}

class _tutorialState extends State<tutorial> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          // 1번 페이지
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.only(top: 70),
                    child: Image.asset('assets/Camera.png', fit: BoxFit.contain),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    '페달 블랙박스\n설치 튜토리얼',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    '차량이 비정상적인 속도를 감지하면\n블랙박스가 자동으로 작동하여\n사용자가 밟고 있는 페달 상태를 기록해 줍니다.\n페달 오조작으로 인한 사고 피해를 예방합시다!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Image.asset('assets/tutorialPage1.png'),
                GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: Center(
                      child: Text(
                        '다음',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 2번 페이지
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.only(top: 0),
                    child: Image.asset('assets/pedal.png', fit: BoxFit.contain),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50.0, right: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    '페달 블랙박스\n이렇게 설치하세요',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    '차량의 페달 왼쪽 측면에 블랙박스를 설치하고\n각도를 정확히 맞춰서\n운전자의 발과 페달 동작이 잘 보이도록 설정하세요.\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.only(top: 50),
                    child: Image.asset('assets/realPedal.png', fit: BoxFit.contain),
                  ),
                ),
                Image.asset('assets/tutorialPage2.png'),
                GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Center(
                      child: Text(
                        '다음',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 3번 페이지
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.only(top: 70),
                    child: Image.asset('assets/Money.png', fit: BoxFit.contain),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 40.0, right: 40.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    '페달 블랙박스\n설치해서 보험료 할인받고\n운전점수 획득하자!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 50.0, right: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    '페달 블랙박스를 설정하면 보험료 할인을 받을 수 있으며,\nTMAP 운전 점수와 연계해 추가 혜택을 누릴 수 있습니다.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Image.asset('assets/tutorialPage3.png'),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // 페이지 이동 추가 필요시 여기에 추가
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Center(
                      child: Text(
                        'SAFE-T 서비스 시작하기',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
