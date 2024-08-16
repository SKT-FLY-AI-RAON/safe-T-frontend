import 'dart:convert'; // UTF-8 인코딩을 위해 추가
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

Future<void> publishMessage(String message) async {
  final String broker = '3.35.30.20'; // EC2 인스턴스 IP
  final int port = 1883;
  final String topic = 'test/topic';

  // 고유한 클라이언트 식별자 생성 (최대 23자)
  String clientId = 'flutter_client_' + DateTime.now().millisecondsSinceEpoch.toString();

  // MQTT 클라이언트 생성
  final client = MqttServerClient(broker, '');
  client.port = port;
  client.logging(on: true);

  // 연결 설정
  client.connectionMessage = MqttConnectMessage()
      .withClientIdentifier(clientId)
      .keepAliveFor(60)
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);

  try {
    // 브로커에 연결
    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected to the broker');

      // 메시지를 UTF-8로 인코딩
      final builder = MqttClientPayloadBuilder();
      builder.addUTF8String(message);  // UTF-8로 문자열을 추가

      // 메시지 발행
      client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
      print('Message "$message" published to topic "$topic"');
    } else {
      print('Failed to connect to the broker: ${client.connectionStatus}');
    }
  } catch (e) {
    print('Connection failed: $e');
    client.disconnect();
  } finally {
    client.disconnect();
  }
}
