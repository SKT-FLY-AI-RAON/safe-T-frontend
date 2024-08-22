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
  NPathOverlay? _combinedPathOverlay;
  bool _locationPermissionGranted = false;
  late Stream<Position> _positionStream;
  StreamSubscription<Position>? _positionSubscription;

  double _currentSpeed = 0.0;
  TimeOfDay _currentTime = TimeOfDay.now();

  bool _isAlert = true; // 주행 이상 여부
  bool _isPipMode = false; // PiP 모드 여부
  late AnimationController _alertController;
  final FlutterTts _flutterTts = FlutterTts();

  // 경로를 구성하는 좌표들 (여러 경로를 합친 것)
  List<NLatLng> customPathPoints = [
    NLatLng(37.49258525, 126.92601052),
    NLatLng(37.49248007, 126.92685168),
    NLatLng(37.49526331, 126.92746432),
    NLatLng(37.49716870, 126.92790337),
    NLatLng(37.49969860, 126.92830516),
    NLatLng(37.50018054, 126.92803238),
    NLatLng(37.50046322, 126.92757926),
    NLatLng(37.50063838, 126.92747467),
    NLatLng(37.50081076, 126.92742886),
    NLatLng(37.50147430, 126.92800634),
    NLatLng(37.50212477, 126.92782019),
    NLatLng(37.50236367, 126.92705794),
    NLatLng(37.50279008, 126.92650695),
    NLatLng(37.50276623, 126.92544312),
    NLatLng(37.50428670, 126.92546867),
    NLatLng(37.50554588, 126.92436477),
    NLatLng(37.50589215, 126.92363755),
    NLatLng(37.50637467, 126.92288922),
    NLatLng(37.51179628, 126.92505054),
    NLatLng(37.51292664, 126.92566636),
    NLatLng(37.51471302, 126.92707141),
    NLatLng(37.51707461, 126.92872047),
    NLatLng(37.51733114, 126.92893288),
    NLatLng(37.52295169, 126.93803402),
    NLatLng(37.52588713, 126.94366517),
    NLatLng(37.52956676, 126.95068070),
    NLatLng(37.53168501, 126.95473415),
    NLatLng(37.53272300, 126.95736607),
    NLatLng(37.53317577, 126.96041790),
    NLatLng(37.53320629, 126.96269506),
    NLatLng(37.53397518, 126.96807139),
    NLatLng(37.53458677, 126.96963348),
    NLatLng(37.53666792, 126.97079468),
    NLatLng(37.54045359, 126.97088158),
    NLatLng(37.54161738, 126.97084899),
    NLatLng(37.54204180, 126.97278161),
    NLatLng(37.54509723, 126.97199577),
    NLatLng(37.54906060, 126.97176822),
    NLatLng(37.55303305, 126.97277456),
    NLatLng(37.55483325, 126.97307669),
    NLatLng(37.55624220, 126.97292756),
    NLatLng(37.55736531, 126.97288654),
    NLatLng(37.55926906, 126.97451422),
    NLatLng(37.56017780, 126.97489449),
    NLatLng(37.56054559, 126.97581415),
    NLatLng(37.56390967, 126.97711479),
    NLatLng(37.56495092, 126.97737313),
    NLatLng(37.56683773, 126.97727751),
    NLatLng(37.56868133, 126.97721784),
    NLatLng(37.56892916, 126.97731189),
    NLatLng(37.56904465, 126.97763810),
    NLatLng(37.56879874, 126.98096432),
    NLatLng(37.56858869, 126.98296516),
    NLatLng(37.56812484, 126.98568599),
    NLatLng(37.56807104, 126.98583333),
    NLatLng(37.56704954, 126.98584399),
    NLatLng(37.56617156, 126.98583175),
    NLatLng(37.56610857, 126.98446514),
    NLatLng(37.56657746, 126.98453752),
  ];

  @override
  void initState() {
    super.initState();

    _initializeTts(); // TTS 초기화 호출
    _checkTtsAvailability(); // TTS 엔진 설치 확인 호출

    _requestLocationPermission();
    _startTimer();

    // 경고 애니메이션 컨트롤러 설정
    _alertController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _alertController.repeat(reverse: true);
  }

  void _initializeTts() async {

    // TTS 초기 설정
    await _flutterTts.setLanguage("ko-KR");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(1.0);

    _flutterTts.setStartHandler(() {
      print("TTS Started");
    });

    _flutterTts.setCompletionHandler(() {
      print("TTS Completed");
    });


    _flutterTts.setErrorHandler((msg) {
      print("TTS Error: $msg");
    });
  }

  void _checkTtsAvailability() async {
    var engines = await _flutterTts.getEngines;
    print("Available TTS engines: $engines");

    if (engines.isEmpty) {
      print("No TTS engines installed.");
    } else {
      print("TTS engines installed: $engines");
    }
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
      _updatePathOverlay(position);

      // 속도를 이용한 주행 이상 감지 예시
      if (_currentSpeed >=0) {
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

  // 경로 업데이트 함수 수정
  void _updatePathOverlay(Position position) {
    if (customPathPoints.isNotEmpty &&
        _isCloseToPath(position, customPathPoints.first)) {
      setState(() {
        customPathPoints.removeAt(0); // 첫 번째 좌표 제거

        // 기존 오버레이를 제거하고 새로 추가
        if (_combinedPathOverlay != null) {
          _mapController.deleteOverlay(NOverlayInfo(type: NOverlayType.pathOverlay, id: 'custom_path'));
        }

        final polygonOverlay = NPolygonOverlay(
          id: 'custom_polygon',
          coords: customPathPoints,  // 다각형의 경계 좌표들
          color: Colors.blue,  // 내부 색상
          outlineColor: Colors.blue,  // 외곽선 색상
          outlineWidth: 20,  // 외곽선 두께
        );

        // 지도에 다각형 오버레이 추가
        _mapController.addOverlay(polygonOverlay);
      });
    }
  }

  bool _isCloseToPath(Position userPosition, NLatLng pathPoint) {
    const double thresholdDistance = 10.0; // 10미터 이내를 임계값으로 설정
    double distance = Geolocator.distanceBetween(
      userPosition.latitude,
      userPosition.longitude,
      pathPoint.latitude,
      pathPoint.longitude,
    );
    return distance < thresholdDistance;
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
    _speakAlertMessage("액셀을밟고있습니다!액셀을밟고있습니다!");


    // PiP 모드로 전환
    //_enterPipMode();
  }

  // 용욱 TTS 경고 추가
  Future<void> _speakAlertMessage(String message) async {
    try {
      await _flutterTts.setLanguage("ko-KR");  // 언어 설정 (한국어: "ko-KR")
      await _flutterTts.setPitch(1.0);  // 음성 피치 조절 (기본값: 1.0)
      await _flutterTts.setSpeechRate(0.5);  // 음성 속도 조절 (0.0 ~ 1.0)
      await _flutterTts.speak(message);  // 메시지를 음성으로 변환
    } catch (e) {
      print("TTS error: $e");
    }
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

    // 15초 후 PiP 모드를 종료
    Future.delayed(Duration(seconds: 15), () {
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
    return Stack(
      children: [
        Scaffold(backgroundColor: Colors.white,),
        SafeArea(
          child: Scaffold(
            floatingActionButton: Stack(
              children: [
                // 새로 추가된 버튼 - 오른쪽 상단에 위치
                Positioned(
                  child: Align(
                    alignment: Alignment(0.95, -0.7),
                    child: FloatingActionButton(
                      onPressed: _triggerAlert,
                      child: Icon(Icons.warning, color: Colors.white),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                    child: Align(
                      alignment: Alignment(1, -0.9),
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
                          'assets/my_location.png',
                          // 현재 위치 버튼 이미지 경로
                          width: 65,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
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
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/load_map.png', // 화살표 버튼 이미지 경로
                        width: 65,
                        height: 65,
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
                            'assets/red_button_new.png',
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

                      // 경로 오버레이 추가
                      _combinedPathOverlay = NPathOverlay(
                        id: 'custom_path',
                        coords: customPathPoints,
                      );
                      _mapController.addOverlay(_combinedPathOverlay!);
                    }
                  },
                ),
                if (_isAlert)
                  FadeTransition(
                    opacity: _alertController,
                    child: Container(
                      color: Colors.red.withOpacity(0.5),
                      child: Center(
                        child: Image.asset(
                          'assets/fedal_warning.png', // 경고 이미지 파일 경로
                          fit: BoxFit.contain,
                          width: 400, // 원하는 이미지 크기 설정
                          height: 400,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                        // Refresh Icon
                        IconButton(
                          icon: Icon(Icons.refresh, color: Colors.black),
                          iconSize: 30,
                          onPressed: () {
                            // 여기에 새로고침 로직 추가
                          },
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline, // Baseline 기준으로 정렬
                          textBaseline: TextBaseline.alphabetic, // Row에서 TextBaseline을 맞추기 위해 설정
                          children: [
                            // Speed Display
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline, // Baseline 기준으로 정렬
                              textBaseline: TextBaseline.alphabetic, // TextBaseline 설정
                              children: [
                                Text(
                                  '${_currentSpeed.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' km',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 40),

                            // Time Display using RichText
                            RichText(
                              text: TextSpan(
                                children: [
                                  // Period Text (오전/오후)
                                  TextSpan(
                                    text: _getPeriod(_currentTime), // Returns "오전" or "오후"
                                    style: TextStyle(
                                      fontSize: 20,  // Smaller font size for period
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(text: ' '),  // Add a space between the period and time

                                  // Time Text (시간)
                                  TextSpan(
                                    text: _getFormattedTime(_currentTime), // Returns "8:33" or similar
                                    style: TextStyle(
                                      fontSize: 35,  // Larger font size for the time
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),



                        // More Options Icon
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
                Align(
                  alignment: Alignment(-1.1,-1),
                  child: SizedBox(
                    child: Image.asset(fit:BoxFit.cover,
                      'assets/green_destination.png', // 추가한 이미지 경로
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isPipMode) _buildPipStream(context),
      ],
    );
  }

  Widget _buildPipStream(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.only(left:10,top:10),
        child: Align(
          alignment: Alignment.center,
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
                width: MediaQuery.of(context).size.height * 1,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.black,
                child: Mjpeg(
                  stream: 'http://172.23.248.9:8080/video',
                  isLive: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getPeriod(TimeOfDay time) {
    return time.period == DayPeriod.am ? '오전' : '오후';
  }

  String _getFormattedTime(TimeOfDay time) {
    int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    return '$hour:${time.minute.toString().padLeft(2, '0')}';
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
