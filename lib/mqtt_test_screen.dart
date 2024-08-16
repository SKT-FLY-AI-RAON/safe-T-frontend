import 'package:flutter/material.dart';
import 'mqtt_publisher.dart'; // MQTT 발행 기능이 포함된 파일

class MqttTestScreen extends StatefulWidget {
  @override
  _MqttTestScreenState createState() => _MqttTestScreenState();
}

class _MqttTestScreenState extends State<MqttTestScreen> {
  final TextEditingController _controller = TextEditingController();
  String _statusMessage = "";

  // MQTT 발행 로직을 호출하는 메소드
  Future<void> _sendMessage() async {
    String message = _controller.text;
    if (message.isNotEmpty) {
      setState(() {
        _statusMessage = "Sending message...";
      });
      try {
        await publishMessage(message);
        setState(() {
          _statusMessage = "Message sent successfully!";
        });
      } catch (e) {
        setState(() {
          _statusMessage = "Failed to send message: $e";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Test Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter message',
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
