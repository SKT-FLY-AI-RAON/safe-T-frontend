import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';

class MqttSubscriber {
  final String broker = '3.35.30.20'; // Flask 서버의 MQTT 브로커 주소
  final int port = 1883; // MQTT 포트 번호
  final String topic = 'pedal/topic'; // 구독할 토픽 이름
  MqttServerClient? client;
  StreamController<String> messageStreamController = StreamController<String>();

  MqttSubscriber() {
    client = MqttServerClient(broker, '');
    client!.port = port;
    client!.keepAlivePeriod = 20;
    client!.onConnected = onConnected;
    client!.onDisconnected = onDisconnected;
    client!.onSubscribed = onSubscribed;
    client!.logging(on: true);
    _connect();
  }

  void _connect() async {
    final connMessage = MqttConnectMessage()
        .withClientIdentifier('flutter_subscriber')
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    client!.connectionMessage = connMessage;

    try {
      await client!.connect();
      client!.subscribe(topic, MqttQos.atMostOnce);
      client!.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
        final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        messageStreamController.add(pt);
        print('수신된 메시지: $pt');
        //TODO 페달 모델 결과에 따라 다른 화면으로 반환하는 것 필요
      });
    } catch (e) {
      print('MQTT 연결 실패: $e');
      client!.disconnect();
    }
  }

  void onConnected() {
    print('MQTT 연결 성공');
  }

  void onDisconnected() {
    print('MQTT 연결 해제');
  }

  void onSubscribed(String topic) {
    print('토픽 구독 완료: $topic');
  }

  void dispose() {
    client!.disconnect();
    messageStreamController.close();
  }

}
