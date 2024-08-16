import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apiTest.dart';
import 'setting.dart';
import 'package:flutter/services.dart';
import 'selectWarnings.dart';
import 'home.dart';
import 'map_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //NaverMap Sdk 초기화 및 clientId 설정
  await NaverMapSdk.instance.initialize(clientId: 'djww0m5kpg');


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // 상태 표시줄 배경 색상
    statusBarIconBrightness: Brightness.dark, // 상태 표시줄 아이콘 색상 (밝은 색상으로)
  ));
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}




