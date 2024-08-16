import 'package:flutter/material.dart';

class selectWarning extends StatefulWidget {
  const selectWarning({super.key});

  @override
  State<selectWarning> createState() => _selectWarningState();
}

class _selectWarningState extends State<selectWarning> {
  String? _selectedMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경고 방식 선택'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          RadioListTile<String>(
            title: Text('페달 블랙박스 화면 보여주기'),
            value: '페달 블랙박스 화면 보여주기',
            groupValue: _selectedMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedMethod = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('내비 화면에서 경고창 보이기'),
            value: '내비 화면에서 경고창 보이기',
            groupValue: _selectedMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedMethod = value;
              });
            },
          ),
        ],
      ),
    );
  }
}