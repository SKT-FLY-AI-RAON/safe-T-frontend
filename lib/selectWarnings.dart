import 'package:flutter/material.dart';

class SelectWarning extends StatefulWidget {
  const SelectWarning({super.key});

  @override
  State<SelectWarning> createState() => _SelectWarningState();
}

class _SelectWarningState extends State<SelectWarning> {
  // 여기서 변수 선언을 제대로 확인합니다.
  int? _selectedWarningMethod; // _selectedWarningMethod가 State 클래스 안에 선언되어야 합니다.

  @override
  void initState() {
    // TODO: API 호출을 통해 값 받아오기
    _selectedWarningMethod = 1;  // 초기 값 설정
    super.initState();
  }

  @override
  void dispose() {
    // TODO: API 호출을 통해 값 보내기
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('경고 방식 선택'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1.5), // 하단 회색 선 추가
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: RadioListTile<int>(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '페달 블랙박스 화면 보여주기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), // 약한 그림자 색상
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0), // 그림자의 오프셋
                          ),
                        ],
                        // border: Border.all( // 검정색 스트로크 추가
                        //   color: Colors.black, // 테두리 색상
                        //   width: 1.0, // 테두리 두께
                        // ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/warning-1.png',
                          width: 200,
                          height: 350,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                value: 1,
                groupValue: _selectedWarningMethod,  // _selectedWarningMethod는 int 타입이어야 합니다.
                onChanged: (int? value) {
                  setState(() {
                    _selectedWarningMethod = value;  // value도 int 타입이어야 합니다.
                    print(_selectedWarningMethod);
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: Colors.blueAccent,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: RadioListTile<int>(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '내비 화면에서 경고창 보이기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), // 약한 그림자 색상
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 0), // 그림자의 오프셋
                          ),
                        ],
                        // border: Border.all( // 검정색 스트로크 추가
                        //   color: Colors.black, // 테두리 색상
                        //   width: 1.0, // 테두리 두께
                        // ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/warning-2.png',
                          width: 200,
                          height: 350,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                value: 2,
                groupValue: _selectedWarningMethod,
                onChanged: (int? value) {
                  setState(() {
                    _selectedWarningMethod = value;
                    print(_selectedWarningMethod);
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),







    );
  }
}
