import 'package:flutter/material.dart';
import 'mqttPublisher.dart'; // MQTT 발행 기능이 포함된 파일

class MqttPublisherTestScreen extends StatefulWidget {
  @override
  _MqttTestScreenState createState() => _MqttTestScreenState();
}

class _MqttTestScreenState extends State<MqttPublisherTestScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String _statusMessage = "";

  // MQTT 발행 로직을 호출하는 메소드
  Future<void> _sendMessage() async {
    String title = _titleController.text;
    String content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      setState(() {
        _statusMessage = "Sending message...";
      });

      // JSON 형태의 메시지 생성
      // Map<String, dynamic> message = {
      //   'title': title,
      //   'content': content,
      //   'timestamp': DateTime.now().toString(),
      // };

      Map<String, dynamic> message = {
        'time': DateTime.now().toString(),
        'rpm':  1,
        'speed': 2,
        'load': 3,
        'throttle': 4,
        'pedal': 5,
        'fuelSystemStatus': title,
      };


      try {
        // JSON 메시지 발행
        await publishJsonMessage(message);
        setState(() {
          _statusMessage = "Message sent successfully!";
        });
      } catch (e) {
        setState(() {
          _statusMessage = "Failed to send message: $e";
        });
      }
    } else {
      setState(() {
        _statusMessage = "Title and content must not be empty!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT JSON Message Sender'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Enter title',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Enter content',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send Message'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
