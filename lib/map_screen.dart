import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late NaverMapController _mapController;
  NMarker? _userLocationMarker;
  bool _locationPermissionGranted = false;
  late Stream<Position> _positionStream;
  StreamSubscription<Position>? _positionSubscription;

  double _currentSpeed = 0.0;
  TimeOfDay _currentTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _startTimer();
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

  @override
  void dispose() {
    _positionSubscription?.cancel(); // 스트림 구독 취소
    super.dispose();
  }

  void _onShieldPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtherScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.speed),
                  onPressed: () {},
                ),
                Text(
                  '${_currentSpeed.toStringAsFixed(1)} km/h',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(width: 20),
                Text(
                  _formatTime(_currentTime),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: _onShieldPressed,
              child: Icon(Icons.shield),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final formattedTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
  }
}

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OBD 연결 화면'),
      ),
      body: const Center(
        child: Text('OBD 연결화면입니다.'),
      ),
    );
  }
}
