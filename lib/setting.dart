import 'package:flutter/material.dart';
import 'package:raon_frontend/selectWarnings.dart';
import 'package:http/http.dart' as http;
import 'selectWarnings_2.dart';
import 'tutorial.dart';
import 'GlobalState.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('SAFE-T', style: TextStyle(color: Colors.black)),
        elevation: 0, // AppBar 그림자 제거
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                children: [
                  Image.asset(
                    'assets/shield.png', // 이미지 파일 이름과 경로
                    width: MediaQuery.of(context).size.width, // 원하는 너비 설정
                    height: MediaQuery.of(context).size.height * 0.2, // 원하는 높이 설정
                    fit: BoxFit.contain, // 이미지를 비율에 맞게 조절
                  ),
                  SizedBox(height: 20), // 이미지와 텍스트 사이의 여백
                  Text(
                    '안전 운전을 위한 SAFE-T의 기능을\n경험해 보세요!',
                    textAlign: TextAlign.center, // 텍스트 가운데 정렬
                    style: TextStyle(
                      fontSize: 20, // 텍스트 크기
                      fontWeight: FontWeight.w500, // 텍스트 굵기
                      color: Colors.black, // 텍스트 색상
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0x189c9c9c),
              height: 10,
              padding: EdgeInsets.only(bottom: 20.0), // 컨테이너 내부 하단 여백
            ),

            // 튜토리얼 화면으로 넘어가기
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0x2D808080)), // 아래쪽 테두리
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20), // ListTile 내부 패딩 추가
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => TutorialScreen(),
                        ),
                      );
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0), // 텍스트 사이 공백 추가
                      child: Text(
                        '튜토리얼',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      '블랙 박스 설치 위치\n튜토리얼을 확인할 수 있습니다.',
                      style: TextStyle(fontSize: 15, color: Color(0xFF717274)),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0x2D808080)), // 아래쪽 테두리
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20), // ListTile 내부 패딩 추가
                    onTap: () async {
                      await context.read<GlobalState>().getHttpRequestData();
                      int AlertModeValue = context.read<GlobalState>().AlertMode;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => SelectWarning_2(selected: AlertModeValue, Id: 1),
                        ),
                      );
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0), // 텍스트 사이 공백 추가
                      child: Text(
                        '경고 방식 선택',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      '주행 중 페달 오조작 상황 발생 시\n내비에서 경고하는 방식을 선택할 수 있습니다.',
                      style: TextStyle(fontSize: 15, color: Color(0xFF717274)),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            // 경고 선택 방식 화면으로 넘어가기



            // // 두 번째 설정 항목 추가 예시
            // Container(
            //   decoration: BoxDecoration(
            //     border: Border(
            //       bottom: BorderSide(color: Color(0x2D808080)), // 아래쪽 테두리
            //     ),
            //   ),
            //   child: ListTile(
            //     onTap: () {
            //       // 두 번째 설정 항목 클릭 시 동작
            //     },
            //     title: Text('알림 설정',
            //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            //     subtitle: Text('알림 방식을 설정할 수 있습니다.',
            //         style: TextStyle(fontSize: 12, color: Colors.grey)),
            //     trailing: Icon(Icons.arrow_forward_ios),
            //   ),
            // ),
            //
            // // 스위치 추가 예시
            // SwitchListTile(
            //   title: Text('알림 활성화'),
            //   subtitle: Text('SAFE-T 알림을 활성화합니다.'),
            //   value: true, // 현재 스위치 상태 (필요에 따라 변경)
            //   onChanged: (bool value) {
            //     // 스위치 상태 변경 시 동작
            //   },
            //   activeColor: Colors.blue,
            // ),
          ],
        ),
      ),
    );
  }
}
//
// // SelectWarning 화면 정의
// class SelectWarning extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('경고 선택'),
//       ),
//       body: Center(
//         child: Text(
//           '경고 선택 화면',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
