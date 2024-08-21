import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectWarning extends StatefulWidget {
  const SelectWarning({Key? key,this.selected,this.Id}) : super(key: key);
  final selected;
  final Id;

  @override
  State<SelectWarning> createState() => _SelectWarningState();
}

class _SelectWarningState extends State<SelectWarning> {
  int? _selectedWarningMethod;
  String _selectedImage = 'assets/warning-1.png'; // 선택된 이미지 경로 초기화

  @override
  void initState() {
    super.initState();
    if (widget.selected == null)
      _selectedWarningMethod = 1; // 초기 선택 값 설정
    else {
      _selectedWarningMethod = widget.selected;
      _updateSelectedImage(_selectedWarningMethod);
    }
  }

  patch() async {
    try {
      final response = await http.patch(
        Uri.parse('http://3.35.30.20:80/setting?userId={$widget.Id}'),
        headers: {
          'Content-Type': 'application/json',  // JSON 형식으로 보낼 때의 헤더
        },
        body: jsonEncode({  // 3. Body (Payload)
          'code': 200,
          "userId": widget.Id,
          "warningOption": _selectedWarningMethod,
        }),  // 데이터를 JSON 형식으로 변환하여 전송
      );

      // 응답 처리
      if (response.statusCode == 200) {
        print('PATCH 요청 성공: ${response.body}');
      } else {
        print('PATCH 요청 실패: 상태 코드 ${response.statusCode}');
        print('응답 본문: ${response.body}');
      }
    } catch (e) {
    print('예외 발생: $e');
    }
  }
  @override
  void dispose() {
    patch();
    super.dispose();
  }

  void _updateSelectedImage(var value) {
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
                // width: MediaQuery.of(context).size.width * 0.9, // 화면 너비의 90% 사용
                height: MediaQuery.of(context).size.height * 0.6, // 고정된 이미지 높이
                fit: BoxFit.contain,
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
