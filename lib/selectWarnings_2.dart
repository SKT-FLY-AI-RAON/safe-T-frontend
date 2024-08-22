import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectWarning_2 extends StatefulWidget {
  const SelectWarning_2({Key? key, this.selected, this.Id}) : super(key: key);
  final selected;
  final Id;

  @override
  State<SelectWarning_2> createState() => _SelectWarning_2State();
}

class _SelectWarning_2State extends State<SelectWarning_2> {
  int? _selectedWarningMethod;

  @override
  void initState() {
    super.initState();
    if (widget.selected == null)
      _selectedWarningMethod = 1; // 초기 선택 값 설정
    else {
      _selectedWarningMethod = widget.selected;
    }
  }

  patch() async {
    try {
      final response = await http.patch(
        Uri.parse('http://3.35.30.20:80/setting?userId=${widget.Id}'),
        headers: {
          'Content-Type': 'application/json', // JSON 형식으로 보낼 때의 헤더
        },
        body: jsonEncode({
          'code': 200,
          "userId": widget.Id,
          "warningOption": _selectedWarningMethod,
        }), // 데이터를 JSON 형식으로 변환하여 전송
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

  void _updateSelectedMethod(int value) {
    setState(() {
      _selectedWarningMethod = value;
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
      body: Container(
        width:double.infinity,
        height:double.infinity,
        // color: Color(0xFFEFF0F4),
        child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height * 0.7,
                      // decoration:BoxDecoration(
                      //   borderRadius:BorderRadius.circular(15),
                      //   // color:Colors.white,
                      // ),
                      child: _buildWarningOption(
                        image: 'assets/warning-1.png',
                        title: '페달\n블랙박스 화면 ',
                        value: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: MediaQuery.of(context).size.height * 0.7,
                      // decoration:BoxDecoration(
                      //   borderRadius:BorderRadius.circular(15),
                      //   color:Colors.white,
                      // ),
                      child: _buildWarningOption(
                        image: 'assets/warning-2.png',
                        title: '네비 화면\n경고창 보이기',
                        value: 2,
                      ),
                    ),
                  ),
                ],
              ),
      ),

    );
  }

  Widget _buildWarningOption({
    required String image,
    required String title,
    required int value,
  }) {
    return GestureDetector(
      onTap: () {
        _updateSelectedMethod(value);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.fill,
            ),
            // Image.asset(
            //   image,
            //   width: MediaQuery.of(context).size.width * 0.4, // 화면 너비의 90% 사용
            //   height: MediaQuery.of(context).size.height * 0.6, // 고정된 이미지 높이
            //   fit: BoxFit.contain,
            // ),
          ),
          SizedBox(height: 10),
          Text(textAlign: TextAlign.center,
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _selectedWarningMethod == value ? Color(0xFF2962F7) : Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Radio<int>(
            value: value,
            groupValue: _selectedWarningMethod,
            onChanged: (int? newValue) {
              if (newValue != null) {
                _updateSelectedMethod(newValue);
              }
            },
            activeColor: Color(0xFF2962F7),
          ),
        ],
      ),
    );
  }
}
