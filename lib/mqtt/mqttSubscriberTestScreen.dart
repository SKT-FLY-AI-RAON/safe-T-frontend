import 'package:flutter/material.dart';
import 'mqttSubscriber.dart';

class MqttSubscriberTestScreen extends StatefulWidget {
  @override
  _MqttSubscriberTestScreenState createState() => _MqttSubscriberTestScreenState();
}

class _MqttSubscriberTestScreenState extends State<MqttSubscriberTestScreen> {
  MqttSubscriber? mqttSubscriber;
  String? receivedMessage;

  @override
  void initState() {
    super.initState();
    mqttSubscriber = MqttSubscriber();
    mqttSubscriber!.messageStreamController.stream.listen((message) {
      setState(() {
        receivedMessage = message;
      });
    });
  }

  @override
  void dispose() {
    mqttSubscriber!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MQTT Subscriber Test'),
      ),
      body: Center(
        child: Text(
          receivedMessage ?? '대기 중...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
