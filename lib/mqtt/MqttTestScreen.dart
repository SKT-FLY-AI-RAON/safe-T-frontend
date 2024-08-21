import 'package:flutter/material.dart';

import 'mqttPublisherTestScreen.dart';
import 'mqttSubscriberTestScreen.dart';

// MqttTestScreen의 새로운 버전
class MqttTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mqtt Test Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MqttPublisherTestScreen(),
                  ),
                );
              },
              child: Text('Go to Mqtt Publisher Test Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MqttSubscriberTestScreen(),
                  ),
                );
              },
              child: Text('Go to Mqtt Subscriber Test Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// // Placeholder for MqttPublisherTestScreen
// class MqttPublisherTestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mqtt Publisher Test Screen'),
//       ),
//       body: Center(
//         child: Text('This is the Mqtt Publisher Test Screen'),
//       ),
//     );
//   }
// }
//
// // Placeholder for MqttSubscriberTestScreen
// class MqttSubscriberTestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mqtt Subscriber Test Screen'),
//       ),
//       body: Center(
//         child: Text('This is the Mqtt Subscriber Test Screen'),
//       ),
//     );
//   }
// }
