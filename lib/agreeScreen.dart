import 'package:flutter/material.dart';
import 'setting.dart';

class agreeScreen extends StatefulWidget {
  const agreeScreen({super.key});

  @override
  State<agreeScreen> createState() => _agreeScreenState();
}

class _agreeScreenState extends State<agreeScreen> {
  bool _agree1 = false;
  bool _agree2 = false;
  bool _agree3 = false;
  bool _agree4 = false;
  bool _agree5 = false;
  bool _all = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SAFT-T\n서비스 이용을 위해\n동의가 필요해요",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _all == false ? Colors.grey : Colors.blueAccent,
                ),
              ),
              child: ListTile(
                leading: Checkbox(
                  value: _all,
                  activeColor: Colors.blueAccent,
                  onChanged: (bool? value) {
                    setState(() {
                      _all = value ?? false;
                      _agree1 = value ?? false;
                      _agree2 = value ?? false;
                      _agree3 = value ?? false;
                      _agree4 = value ?? false;
                      _agree5 = value ?? false;
                    });
                  },
                ),
                // splashColor: Colors.transparent,  // ripple effect 제거
                // selectedTileColor: Colors.transparent, // 선택된 타일 색상 제거
                title: Text(
                    style: TextStyle(
                        color: _all == false ? Colors.black : Colors.blueAccent,
                        fontWeight:
                            _all == false ? FontWeight.w300 : FontWeight.w700),
                    '모두 동의합니다.'),
              ),
            ),
          ),
          Flexible(
            flex: 14,
            child: ListView(
              children: <Widget>[
                CheckboxListTile(
                  activeColor: Colors.blueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  // 체크박스를 leading으로 설정
                  title: Text('[필수] 개인정보 수집 및 이용 동',
                      style: TextStyle(
                          color: _agree1 == false
                              ? Colors.black
                              : Colors.blueAccent)),
                  value: _agree1,
                  onChanged: (bool? value) {
                    setState(() {
                      _agree1 = value ?? false;
                      _all =
                          _agree1 && _agree2 && _agree3 && _agree4 && _agree5;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.blueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  // 체크박스를 leading으로 설정
                  title: Text('[필수] 개인정보 수집 및 이용 동',
                      style: TextStyle(
                          color: _agree2 == false
                              ? Colors.black
                              : Colors.blueAccent)),
                  value: _agree2,
                  onChanged: (bool? value) {
                    setState(() {
                      _agree2 = value ?? false;
                      _all =
                          _agree1 && _agree2 && _agree3 && _agree4 && _agree5;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.blueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  // 체크박스를 leading으로 설정
                  title: Text('[필수] 개인정보 수집 및 이용 동',
                      style: TextStyle(
                          color: _agree3 == false
                              ? Colors.black
                              : Colors.blueAccent)),
                  value: _agree3,
                  onChanged: (bool? value) {
                    setState(() {
                      _agree3 = value ?? false;
                      _all =
                          _agree1 && _agree2 && _agree3 && _agree4 && _agree5;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.blueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  // 체크박스를 leading으로 설정
                  title: Text('[필수] 개인정보 수집 및 이용 동',
                      style: TextStyle(
                          color: _agree4 == false
                              ? Colors.black
                              : Colors.blueAccent)),
                  value: _agree4,
                  onChanged: (bool? value) {
                    setState(() {
                      _agree4 = value ?? false;
                      _all =
                          _agree1 && _agree2 && _agree3 && _agree4 && _agree5;
                    });
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.blueAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                  // 체크박스를 leading으로 설정
                  title: Text('[필수] 개인정보 수집 및 이용 동',
                      style: TextStyle(
                          color: _agree5 == false
                              ? Colors.black
                              : Colors.blueAccent)),
                  value: _agree5,
                  onChanged: (bool? value) {
                    setState(() {
                      _agree5 = value ?? false;
                      _all =
                          _agree1 && _agree2 && _agree3 && _agree4 && _agree5;
                    });
                  },
                ),
              ],
            ),
          ),
          // 제일 하단 넘어가기
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        _all == false ? Color(0xFFEAEAEA) : Colors.blueAccent,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_all == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => setting(),
                          ),
                        );
                      }
                    },
                    child: Center(
                        child: Text('동의하고 계속',
                            style: TextStyle(
                                fontSize: 20,
                                color: _all == false
                                    ? Colors.grey
                                    : Colors.white))),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
