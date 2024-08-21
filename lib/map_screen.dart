import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_in_app_pip/flutter_in_app_pip.dart';
import 'package:flutter_in_app_pip/pip_widget.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:pip_view/pip_view.dart';
import 'bluetooth.dart';  // Bluetooth 스크린 임포트

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late NaverMapController _mapController;
  NMarker? _userLocationMarker;
  bool _locationPermissionGranted = false;
  late Stream<Position> _positionStream;
  StreamSubscription<Position>? _positionSubscription;

  double _currentSpeed = 0.0;
  TimeOfDay _currentTime = TimeOfDay.now();

  bool _isAlert = false; // 주행 이상 여부
  bool _isPipMode = false; // PiP 모드 여부
  late AnimationController _alertController;
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _startTimer();

    // 경고 애니메이션 컨트롤러 설정
    _alertController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _alertController.repeat(reverse: true);
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationPermissionGranted = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationPermissionGranted = false;
      });
      return;
    }

    setState(() {
      _locationPermissionGranted = true;
    });

    _startLocationUpdates();
  }

  void _startLocationUpdates() {
    if (!_locationPermissionGranted) return;

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    _positionSubscription = _positionStream.listen((Position position) {
      _updateLocation(position);
      _updateSpeed(position);

      // 속도를 이용한 주행 이상 감지 예시
      if (_currentSpeed > 100) {
        _triggerAlert();
      }
    });
  }

  Future<void> _updateLocation(Position position) async {
    final currentLatLng = NLatLng(position.latitude, position.longitude);

    // 기존 마커가 있다면 제거하고 새로운 마커 추가
    if (_userLocationMarker != null) {
      _mapController.deleteOverlay(
        NOverlayInfo(type: NOverlayType.marker, id: 'user_location'),
      );
    }

    // 새로운 마커 추가
    _userLocationMarker = NMarker(
      id: 'user_location',
      position: currentLatLng,
      caption: NOverlayCaption(text: 'Your Location'),
    );
    _mapController.addOverlay(_userLocationMarker!);

    _mapController.updateCamera(
      NCameraUpdate.scrollAndZoomTo(
        target: currentLatLng,
        zoom: 15,
      ),
    );
  }

  void _updateSpeed(Position position) {
    setState(() {
      _currentSpeed = position.speed * 3.6; // m/s to km/h 변환
    });
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = TimeOfDay.now();
      });
    });
  }

  void _triggerAlert() {
    setState(() {
      _isAlert = true;
    });
    _speakAlertMessage("Warning! You are driving too fast.");

    // PiP 모드로 전환
    _enterPipMode();
  }

  Future<void> _speakAlertMessage(String message) async {
    await _flutterTts.speak(message);
  }

  void _enterPipMode() async {
    // PiP 모드 시작
    PictureInPicture.startPiP(
      pipWidget: PiPWidget(
        child: _buildPipStream(context), // PiP 모드에서 보여줄 위젯
        onPiPClose: () {
          // PiP 모드 종료 시 호출될 콜백 함수
          setState(() {
            _isPipMode = false;
          });
        },
        elevation: 10, // 선택적 설정
        pipBorderRadius: 10, // 선택적 설정
      ),
    );

    setState(() {
      _isPipMode = true;
    });

    // 5초 후 PiP 모드를 종료
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        PictureInPicture.stopPiP();
        setState(() {
          _isPipMode = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _positionSubscription?.cancel(); // 스트림 구독 취소
    _alertController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PiPMaterialApp( // PiPMaterialApp으로 변경
      home: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              floatingActionButton: Stack(
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment(-0.8, 0.6),
                      child: FloatingActionButton(
                        onPressed: _enterPipMode,
                        child: Icon(Icons.picture_in_picture),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment(-0.8, 0.8),
                      child: GestureDetector(
                        onTap: () {
                          // 좌측 화살표 버튼 클릭시 동작할 로직 추가
                        },
                        child: Image.asset(
                          'assets/black_arrow_button.png', // 화살표 버튼 이미지 경로
                          width: 56,
                          height: 56,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment(1, 0.6),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 2),
                            ),
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.5, color: Color(0xFFE0A4A4)),
                        ),
                        width: 60,
                        height: 60,
                        child: GestureDetector(
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            heightFactor: 0.8,
                            child: Image.asset(
                              'assets/Frame_5005.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BluetoothScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment(1, 0.8),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 2),
                            ),
                          ],
                          color: Color(0xCB4869FF),
                          shape: BoxShape.circle,
                        ),
                        width: 60,
                        height: 60,
                        child: GestureDetector(
                          child: Image.asset(
                            'assets/nugu-button.png',
                            fit: BoxFit.fill,
                          ),
                          onTap: () {
                            // Nugu 버튼 클릭시 동작
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  NaverMap(
                    options: const NaverMapViewOptions(
                      initialCameraPosition: NCameraPosition(
                        target: NLatLng(37.5665, 126.9780), // 서울 시청
                        zoom: 10,
                      ),
                    ),
                    onMapReady: (controller) {
                      _mapController = controller;
                      if (_locationPermissionGranted) {
                        _startLocationUpdates();
                      }
                    },
                  ),
                  if (_isAlert)
                    FadeTransition(
                      opacity: _alertController,
                      child: Container(
                        color: Colors.red.withOpacity(0.5),
                        child: const Center(
                          child: Text(
                            '경고! 주행 이상이 감지되었습니다.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.refresh, color: Colors.black),
                            onPressed: () {
                              // 여기에 새로고침 로직 추가
                            },
                          ),
                          Row(
                            children: [
                              Text(
                                '${_currentSpeed.toStringAsFixed(1)} km',
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                              SizedBox(width: 20),
                              Text(
                                _formatTime(_currentTime),
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.more_vert, color: Colors.black),
                            onPressed: () {
                              // 여기에 더보기 로직 추가
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Image.asset(
                      'assets/green_destination.png', // 추가한 이미지 경로
                      width: 240, // 이미지 크기 조정
                      height: 100,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // 현재 위치로 이동하는 로직
                        if (_userLocationMarker != null) {
                          _mapController.updateCamera(
                            NCameraUpdate.scrollAndZoomTo(
                              target: _userLocationMarker!.position,
                              zoom: 15, // 현재 줌 레벨로 설정
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        'assets/navigation_current_location_button.png',
                        // 현재 위치 버튼 이미지 경로
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  // PiP 모드 실행 버튼 추가
                ],
              ),
            ),
          ),
          // PiP 모드 활성화 시 작은 화면에 MJPEG 스트림을 표시
          if (_isPipMode) _buildPipStream(context),
        ],
      ),
    );
  }

  Widget _buildPipStream(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {
          PictureInPicture.stopPiP();
          setState(() {
            _isPipMode = false;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 200,
            height: 150,
            color: Colors.black,
            child: Mjpeg(
              stream: 'http://172.23.251.156:8080/video',
              isLive: true,
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final formattedTime =
    DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
  }
}

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
      ),
      body: const Center(
        child: Text('This is another screen'),
      ),
    );
  }
}
