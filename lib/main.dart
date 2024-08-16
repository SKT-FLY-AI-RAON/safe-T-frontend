import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apiTest.dart';
import 'setting.dart';
import 'package:flutter/services.dart';
import 'selectWarnings.dart';
import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // 상태 표시줄 배경 색상
    statusBarIconBrightness: Brightness.dark, // 상태 표시줄 아이콘 색상 (밝은 색상으로)
  ));
  runApp(
    MaterialApp(
      home: home(),
    ),
  );
}


