import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class apiTest extends StatefulWidget {
  const apiTest({super.key});

  @override
  State<apiTest> createState() => _apiTestState();
}

class _apiTestState extends State<apiTest> {
  var responseMessage;

  Future<void> sendPostRequest() async {
    final url = Uri.parse('http://3.35.30.20/test/board');  // 1. URL (Endpoint)
    final headers = {'Content-Type': 'application/json'};  // 2. Headers
    final body = jsonEncode({  // 3. Body (Payload)
      'code': 200,
      "content": "ㅎㅇ",
      "title": "ㅎㅇ"
    });

    try {
      print('headers.runtimeType:${headers.runtimeType}');
      print('body.runtimeType:${body.runtimeType}');
      print("send post");
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );  // 4. HTTP Method (POST)
      print("success post");
      print('Port: ${url.port}');print('Path: ${url.path}');
      print(response.headers);
      if (response.statusCode == 200) {
        setState(() {
          responseMessage = 'POST request successful: ${response.body}';
        });
      } else {
        setState(() {
          responseMessage = 'Failed with status code: ${response.statusCode}';
        });
      }
      print(responseMessage);
    } catch (e) {
      setState(() {
        responseMessage = 'Error: $e';
      });
    }
  }

  Future<void> sendPatchRequest() async {
    final url = Uri.parse('http://3.35.30.20/test/board/4');  // 1. URL (Endpoint)
    final headers = {'Content-Type': 'application/json'};  // 2. Headers
    final body = jsonEncode({  // 3. Body (Payload)
      'code': 200,
      "content": "ㅎㅇ",
      "title": "ㄴㄴ"
    });

    try {
      print('headers.runtimeType:${headers.runtimeType}');
      print('body.runtimeType:${body.runtimeType}');
      print("send post");
      final response = await http.patch(
        url,
        headers: headers,
        body: body,
      );  // 4. HTTP Method (POST)
      print("success post");
      print('Port: ${url.port}');
      print('Path: ${url.path}');
      print(response.headers);
      if (response.statusCode == 200) {
        setState(() {
          responseMessage = 'PATCH request successful: ${response.body}';
        });
      } else {
        setState(() {
          responseMessage = 'Failed with status code: ${response.statusCode}';
        });
      }
      print(responseMessage);
    } catch (e) {
      setState(() {
        responseMessage = 'Error: $e';
      });
    }
  }

  Future<void> fetchData() async {
    var url = Uri.parse('http://3.35.30.20/test/');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var decodedResponse = utf8.decode(response.bodyBytes);
        print(url.runtimeType);
        print('Scheme: ${url.scheme}');         // http
        print('Authority: ${url.authority}');   // 3.35.30.20:80
        print('Has absolute path: ${url.hasAbsolutePath}'); // true
        print('Origin: ${url.origin}');         // http://3.35.30.20:80
        print(response.headers);
        print('responseRunTimeType: ${response.runtimeType}');
        print('headers.runtimeType:${response.headers.runtimeType}');
        print(response.body.runtimeType);
        print('Response data: $decodedResponse');
        // 여기서 데이터를 처리하거나 UI에 반영할 수 있습니다.
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:TextButton(child:Text("Post"),
          onPressed:() {
            sendPostRequest();
          }),
        actions:[
          TextButton(child:Text("PATCH"),onPressed:(){
            sendPatchRequest();
          })
        ],
      ),
      body: SizedBox(child:TextButton(
        child:Text("GET"),
        onPressed: () {
          fetchData();
        },
      )),
      // bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
