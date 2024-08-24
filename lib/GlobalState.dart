import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GlobalState extends ChangeNotifier{
  int _AlertMode = 1;
  List<dynamic> httpResponseData = [];

  int get AlertMode => _AlertMode;

  // 상태를 변경하는 setter
  void setIconAlertMode(int value) {
    _AlertMode = value;
    notifyListeners(); // 상태가 변경되었음을 알림 (UI 업데이트)
  }
  getHttpRequestData () async {
    var response = await http.get(Uri.parse('http://3.35.30.20:80/setting?userId=1'));
    var decodedresponse = jsonDecode((utf8.decode(response.bodyBytes)));
    _AlertMode = decodedresponse['data']['warningOption'];
  }
}