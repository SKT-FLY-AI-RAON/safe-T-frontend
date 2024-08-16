import 'package:flutter/material.dart';

class selectWarning extends StatefulWidget {
  const selectWarning({super.key});

  @override
  State<selectWarning> createState() => _selectWarningState();
}

class _selectWarningState extends State<selectWarning> {
  int? _selectedWarningMethod;

  @override
  void initState() {
    // TODO: API 호출을 통해 값 받아오기
    _selectedWarningMethod = 1;
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
          RadioListTile<int>(
            title: Text('페달 블랙박스 화면 보여주기'),
            value: 1,  // int 타입으로 설정
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
          RadioListTile<int>(
            title: Text('내비 화면에서 경고창 보이기'),
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
        ],
      ),
    );
  }
}
