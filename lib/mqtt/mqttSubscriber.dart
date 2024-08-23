import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';
import 'dart:math'; // 랜덤 숫자 생성을 위해 추가

class MqttSubscriber {
  final String broker = '3.35.30.20'; // Flask 서버의 MQTT 브로커 주소
  final int port = 1883; // MQTT 포트 번호
  final String topic = 'pedal/topic'; // 구독할 토픽 이름
  MqttServerClient? client;
  StreamController<String> messageStreamController = StreamController<String>.broadcast();
  bool isDisposed = false;

  MqttSubscriber() {
    // 고유한 클라이언트 ID를 랜덤 숫자를 사용하여 생성
    final String uniqueClientId = 'flutter_client_' + DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    client = MqttServerClient(broker, uniqueClientId); // 고유한 클라이언트 ID 사용
    client!.port = port;
    client!.keepAlivePeriod = 20;
    client!.onConnected = onConnected;
    client!.onDisconnected = onDisconnected;
    client!.onSubscribed = onSubscribed;
    client!.logging(on: true);
    _connect();
  }

  void _connect() async {
    if (isDisposed) return;
    final connMessage = MqttConnectMessage()
        .withClientIdentifier(client!.clientIdentifier) // 고유한 클라이언트 ID 사용
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
        // print('수신된 메시지: $pt');
      });
    } catch (e) {
      print('MQTT 연결 실패: $e');
      client?.disconnect();
    }
  }

  // Stream을 외부로 노출
  Stream<String> get messageStream => messageStreamController.stream;

  void onConnected() {
    print('MQTT 연결 성공');
  }

  void onDisconnected() {
    if (isDisposed) return;
    print('MQTT 연결 해제');
    // 재연결 로직 추가
    Future.delayed(Duration(seconds: 5), () {
      _connect(); // 재연결 시도
    });
  }

  void onSubscribed(String topic) {
    print('토픽 구독 완료: $topic');
  }

  void dispose() {
    isDisposed = true;
    client?.disconnect(); // Null 체크 추가
    messageStreamController.close();
  }
}
