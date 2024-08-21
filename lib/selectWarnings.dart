import 'package:flutter/material.dart';

class SelectWarning extends StatefulWidget {
  const SelectWarning({Key? key}) : super(key: key);

  @override
  State<SelectWarning> createState() => _SelectWarningState();
}

class _SelectWarningState extends State<SelectWarning> {
  int? _selectedWarningMethod;
  String _selectedImage = 'assets/warning-1.png'; // 선택된 이미지 경로 초기화

  @override
  void initState() {
    _selectedWarningMethod = 1; // 초기 선택 값 설정
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateSelectedImage(int value) {
    setState(() {
      _selectedWarningMethod = value;
      if (value == 1) {
        _selectedImage = 'assets/warning-1.png';
      } else if (value == 2) {
        _selectedImage = 'assets/warning-2.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '경고 방식 선택',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // 선택된 이미지가 상단에 표시됨
          Container(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                _selectedImage,
                width: MediaQuery.of(context).size.width * 0.9, // 화면 너비의 90% 사용
                height: 250, // 고정된 이미지 높이
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildWarningOption(
                  title: '페달 블랙박스 화면 보여주기',
                  value: 1,
                ),
                _buildWarningOption(
                  title: '내비 화면에서 경고창 보이기',
                  value: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningOption({
    required String title,
    required int value,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RadioListTile<int>(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: value,
          groupValue: _selectedWarningMethod,
          onChanged: (int? newValue) {
            if (newValue != null) {
              _updateSelectedImage(newValue); // 선택된 이미지 업데이트
            }
          },
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
