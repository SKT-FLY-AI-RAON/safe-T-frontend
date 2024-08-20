import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'dart:convert';
import 'apiTest.dart';
import 'setting.dart';
import 'selectWarnings.dart';
import 'home.dart';
import 'map_screen.dart';
import 'agreeScreen.dart';
import 'streaming.dart';
import 'tutorial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // NaverMap SDK 초기화 및 clientId 설정
  await NaverMapSdk.instance.initialize(clientId: 'djww0m5kpg');

  // 상태 표시줄 스타일 설정
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // 상태 표시줄 배경 색상
    statusBarIconBrightness: Brightness.dark, // 상태 표시줄 아이콘 색상 (밝은 색상으로)
  ));

  runApp(
    MaterialApp(
      home: PageViewExample(),  // Home 위젯으로 시작
    ),
  );
}
