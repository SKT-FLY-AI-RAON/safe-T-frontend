import 'package:flutter/material.dart';
import 'setting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgreeScreen extends StatefulWidget {
  const AgreeScreen({super.key,this.Id});
  final Id;

  @override
  State<AgreeScreen> createState() => _AgreeScreenState();
}

class _AgreeScreenState extends State<AgreeScreen> {
  bool _agree1 = false;
  bool _agree2 = false;
  bool _agree3 = false;
  bool _agree4 = false;
  bool _agree5 = false;
  bool _all = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  patch() async {
    try {
      final response = await http.patch(
        Uri.parse('http://3.35.30.20:80/setting/agreement?userId={$widget.Id}'),
        headers: {
          'Content-Type': 'application/json',  // JSON 형식으로 보낼 때의 헤더
        },
        body: jsonEncode({  // 3. Body (Payload)
          'code': 200,
          "agreement": true,
          "userId": widget.Id,
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
    // TODO: implement dispose
    patch();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 30.0, top: 20.0),  // 하단 여백 추가
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SAFT-T\n서비스 이용을 위해\n동의가 필요해요",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _all ? Color(0xFF2962F7) : Colors.grey,
                ),
              ),
              child: ListTile(
                leading: Transform.scale(
                  scale: 1.25,
                  child: Checkbox(
                    value: _all,
                    activeColor: Color(0xFF2962F7),
                    onChanged: (bool? value) {
                      setState(() {
                        _all = value ?? false;
                        _agree1 = _all;
                        _agree2 = _all;
                        _agree3 = _all;
                        _agree4 = _all;
                        _agree5 = _all;
                      });
                    },
                  ),
                ),
                title: Text(
                  '모두 동의합니다.',
                  style: TextStyle(
                    color: _all ? Color(0xFF2962F7) : Colors.black,
                    fontWeight: _all ? FontWeight.w700 : FontWeight.w300,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _all = !_all;
                    _agree1 = _all;
                    _agree2 = _all;
                    _agree3 = _all;
                    _agree4 = _all;
                    _agree5 = _all;
                  });
                },
              ),
            ),
          ),


          // 정보 수집 동의
          Flexible(
            flex: 14,
            child: ListView(
              children: <Widget>[
                _buildCustomCheckboxTile(_agree1, (bool value) {
                  setState(() {
                    _agree1 = value;
                    _updateAllCheckbox();
                  });
                }),
                _buildCustomCheckboxTile(_agree2, (bool value) {
                  setState(() {
                    _agree2 = value;
                    _updateAllCheckbox();
                  });
                }),
                _buildCustomCheckboxTile(_agree3, (bool value) {
                  setState(() {
                    _agree3 = value;
                    _updateAllCheckbox();
                  });
                }),
                _buildCustomCheckboxTile(_agree4, (bool value) {
                  setState(() {
                    _agree4 = value;
                    _updateAllCheckbox();
                  });
                }),
                _buildCustomCheckboxTile(_agree5, (bool value) {
                  setState(() {
                    _agree5 = value;
                    _updateAllCheckbox();
                  });
                }),
              ],
            ),
          ),

          // 동의하고 계속
             Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15), // 좌우 마진 설정
                  width: double.infinity, // 버튼이 화면 전체 너비를 차지하게 설정
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                    color: _all == false ? Color(0xFFEAEAEA) : Color(0xFF2962F7), // 색상 변경
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_all == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Setting(),
                          ),
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        '동의하고 계속',
                        style: TextStyle(
                          fontSize: 18, // 텍스트 크기 설정
                          fontWeight: FontWeight.bold, // 텍스트 굵기 설정
                          color: _all == false ? Colors.grey : Colors.white, // 텍스트 색상 설정
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }

  Widget _buildCustomCheckboxTile(bool isChecked, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: _buildCustomCheckbox(isChecked, onChanged),
      contentPadding: EdgeInsets.only(left: 20.0),
      title: Text(
        '[필수] 개인정보 수집 및 이용 동의',
        style: TextStyle(
          // color: isChecked ? Color(0xFF2962F7) : Colors.black,
          color: Colors.grey,
        ),
      ),
      onTap: () {
        onChanged(!isChecked);
      },
    );
  }

  Widget _buildCustomCheckbox(bool isChecked, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Icon(
        Icons.check,  // 체크 아이콘만 표시
        color: isChecked ? Color(0xFF2962F7) : Colors.grey,  // 상태에 따라 색상 변경
        size: 24.0,  // 크기 조정
      ),
    );
  }

  void _updateAllCheckbox() {
    setState(() {
      _all = _agree1 && _agree2 && _agree3 && _agree4 && _agree5;
    });
  }
}
