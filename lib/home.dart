import 'package:flutter/material.dart';
import 'package:raon_frontend/agreeScreen.dart';
import 'package:raon_frontend/boramae.dart';
import 'package:raon_frontend/setting.dart';
import 'bluetooth.dart';
import 'mqtt/MqttTestScreen.dart';
import 'mqtt/mqttPublisherTestScreen.dart';
import 'map_screen.dart';
import 'streaming.dart';
import 'mqtt/mqttSubscriberTestScreen.dart';
import 'boramae.dart';
import 'setting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'firstscreen.dart';
import 'mqtt/mqttPublisher.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final inputData = TextEditingController();

  List<Map<String, dynamic>> scenarioDataList = [
    {
      "time": "2024-08-21 12:30",
      "RPM": 1000.0,
      "Speed": 0.0,
      "Load": 30.0,
      "ThrottlePos": 10.0,
      "PedalPos": 10.0,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1012.658228,
      "Speed": 0.379746835,
      "Load": 30.25316456,
      "ThrottlePos": 10.25316456,
      "PedalPos": 10.25316456,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1025.316456,
      "Speed": 0.759493671,
      "Load": 30.50632911,
      "ThrottlePos": 10.50632911,
      "PedalPos": 10.50632911,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1037.974684,
      "Speed": 1.139240506,
      "Load": 30.75949367,
      "ThrottlePos": 10.75949367,
      "PedalPos": 10.75949367,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1050.632911,
      "Speed": 1.518987342,
      "Load": 31.01265823,
      "ThrottlePos": 11.01265823,
      "PedalPos": 11.01265823,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1063.291139,
      "Speed": 1.898734177,
      "Load": 31.26582278,
      "ThrottlePos": 11.26582278,
      "PedalPos": 11.26582278,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1075.949367,
      "Speed": 2.278481013,
      "Load": 31.51898734,
      "ThrottlePos": 11.51898734,
      "PedalPos": 11.51898734,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1088.607595,
      "Speed": 2.658227848,
      "Load": 31.7721519,
      "ThrottlePos": 11.7721519,
      "PedalPos": 11.7721519,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1101.265823,
      "Speed": 3.037974684,
      "Load": 32.02531646,
      "ThrottlePos": 12.02531646,
      "PedalPos": 12.02531646,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1113.924051,
      "Speed": 3.417721519,
      "Load": 32.27848101,
      "ThrottlePos": 12.27848101,
      "PedalPos": 12.27848101,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1126.582278,
      "Speed": 3.797468354,
      "Load": 32.53164557,
      "ThrottlePos": 12.53164557,
      "PedalPos": 12.53164557,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1139.240506,
      "Speed": 4.17721519,
      "Load": 32.78481013,
      "ThrottlePos": 12.78481013,
      "PedalPos": 12.78481013,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1151.898734,
      "Speed": 4.556962025,
      "Load": 33.03797468,
      "ThrottlePos": 13.03797468,
      "PedalPos": 13.03797468,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1164.556962,
      "Speed": 4.936708861,
      "Load": 33.29113924,
      "ThrottlePos": 13.29113924,
      "PedalPos": 13.29113924,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1177.21519,
      "Speed": 5.316455696,
      "Load": 33.5443038,
      "ThrottlePos": 13.5443038,
      "PedalPos": 13.5443038,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1189.873418,
      "Speed": 5.696202532,
      "Load": 33.79746835,
      "ThrottlePos": 13.79746835,
      "PedalPos": 13.79746835,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1202.531646,
      "Speed": 6.075949367,
      "Load": 34.05063291,
      "ThrottlePos": 14.05063291,
      "PedalPos": 14.05063291,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1215.189873,
      "Speed": 6.455696203,
      "Load": 34.30379747,
      "ThrottlePos": 14.30379747,
      "PedalPos": 14.30379747,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1227.848101,
      "Speed": 6.835443038,
      "Load": 34.55696203,
      "ThrottlePos": 14.55696203,
      "PedalPos": 14.55696203,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1240.506329,
      "Speed": 7.215189873,
      "Load": 34.81012658,
      "ThrottlePos": 14.81012658,
      "PedalPos": 14.81012658,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1253.164557,
      "Speed": 7.594936709,
      "Load": 35.06329114,
      "ThrottlePos": 15.06329114,
      "PedalPos": 15.06329114,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1265.822785,
      "Speed": 7.974683544,
      "Load": 35.3164557,
      "ThrottlePos": 15.3164557,
      "PedalPos": 15.3164557,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1278.481013,
      "Speed": 8.35443038,
      "Load": 35.56962025,
      "ThrottlePos": 15.56962025,
      "PedalPos": 15.56962025,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1291.139241,
      "Speed": 8.734177215,
      "Load": 35.82278481,
      "ThrottlePos": 15.82278481,
      "PedalPos": 15.82278481,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1303.797468,
      "Speed": 9.113924051,
      "Load": 36.07594937,
      "ThrottlePos": 16.07594937,
      "PedalPos": 16.07594937,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1316.455696,
      "Speed": 9.493670886,
      "Load": 36.32911392,
      "ThrottlePos": 16.32911392,
      "PedalPos": 16.32911392,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1329.113924,
      "Speed": 9.873417722,
      "Load": 36.58227848,
      "ThrottlePos": 16.58227848,
      "PedalPos": 16.58227848,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1341.772152,
      "Speed": 10.25316456,
      "Load": 36.83544304,
      "ThrottlePos": 16.83544304,
      "PedalPos": 16.83544304,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1354.43038,
      "Speed": 10.63291139,
      "Load": 37.08860759,
      "ThrottlePos": 17.08860759,
      "PedalPos": 17.08860759,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1367.088608,
      "Speed": 11.01265823,
      "Load": 37.34177215,
      "ThrottlePos": 17.34177215,
      "PedalPos": 17.34177215,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1379.746835,
      "Speed": 11.39240506,
      "Load": 37.59493671,
      "ThrottlePos": 17.59493671,
      "PedalPos": 17.59493671,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1392.405063,
      "Speed": 11.7721519,
      "Load": 37.84810127,
      "ThrottlePos": 17.84810127,
      "PedalPos": 17.84810127,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1405.063291,
      "Speed": 12.15189873,
      "Load": 38.10126582,
      "ThrottlePos": 18.10126582,
      "PedalPos": 18.10126582,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1417.721519,
      "Speed": 12.53164557,
      "Load": 38.35443038,
      "ThrottlePos": 18.35443038,
      "PedalPos": 18.35443038,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1430.379747,
      "Speed": 12.91139241,
      "Load": 38.60759494,
      "ThrottlePos": 18.60759494,
      "PedalPos": 18.60759494,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1443.037975,
      "Speed": 13.29113924,
      "Load": 38.86075949,
      "ThrottlePos": 18.86075949,
      "PedalPos": 18.86075949,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1455.696203,
      "Speed": 13.67088608,
      "Load": 39.11392405,
      "ThrottlePos": 19.11392405,
      "PedalPos": 19.11392405,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1468.35443,
      "Speed": 14.05063291,
      "Load": 39.36708861,
      "ThrottlePos": 19.36708861,
      "PedalPos": 19.36708861,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1481.012658,
      "Speed": 14.43037975,
      "Load": 39.62025316,
      "ThrottlePos": 19.62025316,
      "PedalPos": 19.62025316,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1493.670886,
      "Speed": 14.81012658,
      "Load": 39.87341772,
      "ThrottlePos": 19.87341772,
      "PedalPos": 19.87341772,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1506.329114,
      "Speed": 15.18987342,
      "Load": 40.12658228,
      "ThrottlePos": 20.12658228,
      "PedalPos": 20.12658228,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1518.987342,
      "Speed": 15.56962025,
      "Load": 40.37974684,
      "ThrottlePos": 20.37974684,
      "PedalPos": 20.37974684,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1531.64557,
      "Speed": 15.94936709,
      "Load": 40.63291139,
      "ThrottlePos": 20.63291139,
      "PedalPos": 20.63291139,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1544.303797,
      "Speed": 16.32911392,
      "Load": 40.88607595,
      "ThrottlePos": 20.88607595,
      "PedalPos": 20.88607595,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1556.962025,
      "Speed": 16.70886076,
      "Load": 41.13924051,
      "ThrottlePos": 21.13924051,
      "PedalPos": 21.13924051,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1569.620253,
      "Speed": 17.08860759,
      "Load": 41.39240506,
      "ThrottlePos": 21.39240506,
      "PedalPos": 21.39240506,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1582.278481,
      "Speed": 17.46835443,
      "Load": 41.64556962,
      "ThrottlePos": 21.64556962,
      "PedalPos": 21.64556962,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1594.936709,
      "Speed": 17.84810127,
      "Load": 41.89873418,
      "ThrottlePos": 21.89873418,
      "PedalPos": 21.89873418,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1607.594937,
      "Speed": 18.2278481,
      "Load": 42.15189873,
      "ThrottlePos": 22.15189873,
      "PedalPos": 22.15189873,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1620.253165,
      "Speed": 18.60759494,
      "Load": 42.40506329,
      "ThrottlePos": 22.40506329,
      "PedalPos": 22.40506329,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1632.911392,
      "Speed": 18.98734177,
      "Load": 42.65822785,
      "ThrottlePos": 22.65822785,
      "PedalPos": 22.65822785,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1645.56962,
      "Speed": 19.36708861,
      "Load": 42.91139241,
      "ThrottlePos": 22.91139241,
      "PedalPos": 22.91139241,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1658.227848,
      "Speed": 19.74683544,
      "Load": 43.16455696,
      "ThrottlePos": 23.16455696,
      "PedalPos": 23.16455696,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1670.886076,
      "Speed": 20.12658228,
      "Load": 43.41772152,
      "ThrottlePos": 23.41772152,
      "PedalPos": 23.41772152,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1683.544304,
      "Speed": 20.50632911,
      "Load": 43.67088608,
      "ThrottlePos": 23.67088608,
      "PedalPos": 23.67088608,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1696.202532,
      "Speed": 20.88607595,
      "Load": 43.92405063,
      "ThrottlePos": 23.92405063,
      "PedalPos": 23.92405063,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1708.860759,
      "Speed": 21.26582278,
      "Load": 44.17721519,
      "ThrottlePos": 24.17721519,
      "PedalPos": 24.17721519,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1721.518987,
      "Speed": 21.64556962,
      "Load": 44.43037975,
      "ThrottlePos": 24.43037975,
      "PedalPos": 24.43037975,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1734.177215,
      "Speed": 22.02531646,
      "Load": 44.6835443,
      "ThrottlePos": 24.6835443,
      "PedalPos": 24.6835443,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:30",
      "RPM": 1746.835443,
      "Speed": 22.40506329,
      "Load": 44.93670886,
      "ThrottlePos": 24.93670886,
      "PedalPos": 24.93670886,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1759.493671,
      "Speed": 22.78481013,
      "Load": 45.18987342,
      "ThrottlePos": 25.18987342,
      "PedalPos": 25.18987342,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1772.151899,
      "Speed": 23.16455696,
      "Load": 45.44303797,
      "ThrottlePos": 25.44303797,
      "PedalPos": 25.44303797,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1784.810127,
      "Speed": 23.5443038,
      "Load": 45.69620253,
      "ThrottlePos": 25.69620253,
      "PedalPos": 25.69620253,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1797.468354,
      "Speed": 23.92405063,
      "Load": 45.94936709,
      "ThrottlePos": 25.94936709,
      "PedalPos": 25.94936709,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1810.126582,
      "Speed": 24.30379747,
      "Load": 46.20253165,
      "ThrottlePos": 26.20253165,
      "PedalPos": 26.20253165,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1822.78481,
      "Speed": 24.6835443,
      "Load": 46.4556962,
      "ThrottlePos": 26.4556962,
      "PedalPos": 26.4556962,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1835.443038,
      "Speed": 25.06329114,
      "Load": 46.70886076,
      "ThrottlePos": 26.70886076,
      "PedalPos": 26.70886076,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1848.101266,
      "Speed": 25.44303797,
      "Load": 46.96202532,
      "ThrottlePos": 26.96202532,
      "PedalPos": 26.96202532,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1860.759494,
      "Speed": 25.82278481,
      "Load": 47.21518987,
      "ThrottlePos": 27.21518987,
      "PedalPos": 27.21518987,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1873.417722,
      "Speed": 26.20253165,
      "Load": 47.46835443,
      "ThrottlePos": 27.46835443,
      "PedalPos": 27.46835443,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1886.075949,
      "Speed": 26.58227848,
      "Load": 47.72151899,
      "ThrottlePos": 27.72151899,
      "PedalPos": 27.72151899,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1898.734177,
      "Speed": 26.96202532,
      "Load": 47.97468354,
      "ThrottlePos": 27.97468354,
      "PedalPos": 27.97468354,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1911.392405,
      "Speed": 27.34177215,
      "Load": 48.2278481,
      "ThrottlePos": 28.2278481,
      "PedalPos": 28.2278481,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1924.050633,
      "Speed": 27.72151899,
      "Load": 48.48101266,
      "ThrottlePos": 28.48101266,
      "PedalPos": 28.48101266,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1936.708861,
      "Speed": 28.10126582,
      "Load": 48.73417722,
      "ThrottlePos": 28.73417722,
      "PedalPos": 28.73417722,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1949.367089,
      "Speed": 28.48101266,
      "Load": 48.98734177,
      "ThrottlePos": 28.98734177,
      "PedalPos": 28.98734177,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1962.025316,
      "Speed": 28.86075949,
      "Load": 49.24050633,
      "ThrottlePos": 29.24050633,
      "PedalPos": 29.24050633,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1974.683544,
      "Speed": 29.24050633,
      "Load": 49.49367089,
      "ThrottlePos": 29.49367089,
      "PedalPos": 29.49367089,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 1987.341772,
      "Speed": 29.62025316,
      "Load": 49.74683544,
      "ThrottlePos": 29.74683544,
      "PedalPos": 29.74683544,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2000.0,
      "Speed": 30.0,
      "Load": 50.0,
      "ThrottlePos": 30.0,
      "PedalPos": 30.0,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2000.0,
      "Speed": 30.0,
      "Load": 50.0,
      "ThrottlePos": 30.0,
      "PedalPos": 30.0,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2076.923077,
      "Speed": 30.51282051,
      "Load": 50.76923077,
      "ThrottlePos": 31.02564103,
      "PedalPos": 31.28205128,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2153.846154,
      "Speed": 31.02564103,
      "Load": 51.53846154,
      "ThrottlePos": 32.05128205,
      "PedalPos": 32.56410256,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2230.769231,
      "Speed": 31.53846154,
      "Load": 52.30769231,
      "ThrottlePos": 33.07692308,
      "PedalPos": 33.84615385,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2307.692308,
      "Speed": 32.05128205,
      "Load": 53.07692308,
      "ThrottlePos": 34.1025641,
      "PedalPos": 35.12820513,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2384.615385,
      "Speed": 32.56410256,
      "Load": 53.84615385,
      "ThrottlePos": 35.12820513,
      "PedalPos": 36.41025641,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2461.538462,
      "Speed": 33.07692308,
      "Load": 54.61538462,
      "ThrottlePos": 36.15384615,
      "PedalPos": 37.69230769,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2538.461538,
      "Speed": 33.58974359,
      "Load": 55.38461538,
      "ThrottlePos": 37.17948718,
      "PedalPos": 38.97435897,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2615.384615,
      "Speed": 34.1025641,
      "Load": 56.15384615,
      "ThrottlePos": 38.20512821,
      "PedalPos": 40.25641026,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2692.307692,
      "Speed": 34.61538462,
      "Load": 56.92307692,
      "ThrottlePos": 39.23076923,
      "PedalPos": 41.53846154,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2769.230769,
      "Speed": 35.12820513,
      "Load": 57.69230769,
      "ThrottlePos": 40.25641026,
      "PedalPos": 42.82051282,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2846.153846,
      "Speed": 35.64102564,
      "Load": 58.46153846,
      "ThrottlePos": 41.28205128,
      "PedalPos": 44.1025641,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 2923.076923,
      "Speed": 36.15384615,
      "Load": 59.23076923,
      "ThrottlePos": 42.30769231,
      "PedalPos": 45.38461538,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3000.0,
      "Speed": 36.66666667,
      "Load": 60.0,
      "ThrottlePos": 43.33333333,
      "PedalPos": 46.66666667,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3076.923077,
      "Speed": 37.17948718,
      "Load": 60.76923077,
      "ThrottlePos": 44.35897436,
      "PedalPos": 47.94871795,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3153.846154,
      "Speed": 37.69230769,
      "Load": 61.53846154,
      "ThrottlePos": 45.38461538,
      "PedalPos": 49.23076923,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3230.769231,
      "Speed": 38.20512821,
      "Load": 62.30769231,
      "ThrottlePos": 46.41025641,
      "PedalPos": 50.51282051,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3307.692308,
      "Speed": 38.71794872,
      "Load": 63.07692308,
      "ThrottlePos": 47.43589744,
      "PedalPos": 51.79487179,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3384.615385,
      "Speed": 39.23076923,
      "Load": 63.84615385,
      "ThrottlePos": 48.46153846,
      "PedalPos": 53.07692308,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3461.538462,
      "Speed": 39.74358974,
      "Load": 64.61538462,
      "ThrottlePos": 49.48717949,
      "PedalPos": 54.35897436,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3538.461538,
      "Speed": 40.25641026,
      "Load": 65.38461538,
      "ThrottlePos": 50.51282051,
      "PedalPos": 55.64102564,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3615.384615,
      "Speed": 40.76923077,
      "Load": 66.15384615,
      "ThrottlePos": 51.53846154,
      "PedalPos": 56.92307692,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3692.307692,
      "Speed": 41.28205128,
      "Load": 66.92307692,
      "ThrottlePos": 52.56410256,
      "PedalPos": 58.20512821,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3769.230769,
      "Speed": 41.79487179,
      "Load": 67.69230769,
      "ThrottlePos": 53.58974359,
      "PedalPos": 59.48717949,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3846.153846,
      "Speed": 42.30769231,
      "Load": 68.46153846,
      "ThrottlePos": 54.61538462,
      "PedalPos": 60.76923077,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 3923.076923,
      "Speed": 42.82051282,
      "Load": 69.23076923,
      "ThrottlePos": 55.64102564,
      "PedalPos": 62.05128205,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4000.0,
      "Speed": 43.33333333,
      "Load": 70.0,
      "ThrottlePos": 56.66666667,
      "PedalPos": 63.33333333,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4076.923077,
      "Speed": 43.84615385,
      "Load": 70.76923077,
      "ThrottlePos": 57.69230769,
      "PedalPos": 64.61538462,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4153.846154,
      "Speed": 44.35897436,
      "Load": 71.53846154,
      "ThrottlePos": 58.71794872,
      "PedalPos": 65.8974359,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4230.769231,
      "Speed": 44.87179487,
      "Load": 72.30769231,
      "ThrottlePos": 59.74358974,
      "PedalPos": 67.17948718,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4307.692308,
      "Speed": 45.38461538,
      "Load": 73.07692308,
      "ThrottlePos": 60.76923077,
      "PedalPos": 68.46153846,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4384.615385,
      "Speed": 45.8974359,
      "Load": 73.84615385,
      "ThrottlePos": 61.79487179,
      "PedalPos": 69.74358974,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4461.538462,
      "Speed": 46.41025641,
      "Load": 74.61538462,
      "ThrottlePos": 62.82051282,
      "PedalPos": 71.02564103,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4538.461538,
      "Speed": 46.92307692,
      "Load": 75.38461538,
      "ThrottlePos": 63.84615385,
      "PedalPos": 72.30769231,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4615.384615,
      "Speed": 47.43589744,
      "Load": 76.15384615,
      "ThrottlePos": 64.87179487,
      "PedalPos": 73.58974359,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4692.307692,
      "Speed": 47.94871795,
      "Load": 76.92307692,
      "ThrottlePos": 65.8974359,
      "PedalPos": 74.87179487,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4769.230769,
      "Speed": 48.46153846,
      "Load": 77.69230769,
      "ThrottlePos": 66.92307692,
      "PedalPos": 76.15384615,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4846.153846,
      "Speed": 48.97435897,
      "Load": 78.46153846,
      "ThrottlePos": 67.94871795,
      "PedalPos": 77.43589744,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 4923.076923,
      "Speed": 49.48717949,
      "Load": 79.23076923,
      "ThrottlePos": 68.97435897,
      "PedalPos": 78.71794872,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:31",
      "RPM": 5000.0,
      "Speed": 50.0,
      "Load": 80.0,
      "ThrottlePos": 70.0,
      "PedalPos": 80.0,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 5000.0,
      "Speed": 50.0,
      "Load": 80.0,
      "ThrottlePos": 70.0,
      "PedalPos": 80.0,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4962.025316,
      "Speed": 49.74683544,
      "Load": 79.62025316,
      "ThrottlePos": 69.49367089,
      "PedalPos": 79.36708861,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4924.050633,
      "Speed": 49.49367089,
      "Load": 79.24050633,
      "ThrottlePos": 68.98734177,
      "PedalPos": 78.73417722,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4886.075949,
      "Speed": 49.24050633,
      "Load": 78.86075949,
      "ThrottlePos": 68.48101266,
      "PedalPos": 78.10126582,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4848.101266,
      "Speed": 48.98734177,
      "Load": 78.48101266,
      "ThrottlePos": 67.97468354,
      "PedalPos": 77.46835443,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4810.126582,
      "Speed": 48.73417722,
      "Load": 78.10126582,
      "ThrottlePos": 67.46835443,
      "PedalPos": 76.83544304,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4772.151899,
      "Speed": 48.48101266,
      "Load": 77.72151899,
      "ThrottlePos": 66.96202532,
      "PedalPos": 76.20253165,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4734.177215,
      "Speed": 48.2278481,
      "Load": 77.34177215,
      "ThrottlePos": 66.4556962,
      "PedalPos": 75.56962025,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4696.202532,
      "Speed": 47.97468354,
      "Load": 76.96202532,
      "ThrottlePos": 65.94936709,
      "PedalPos": 74.93670886,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4658.227848,
      "Speed": 47.72151899,
      "Load": 76.58227848,
      "ThrottlePos": 65.44303797,
      "PedalPos": 74.30379747,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4620.253165,
      "Speed": 47.46835443,
      "Load": 76.20253165,
      "ThrottlePos": 64.93670886,
      "PedalPos": 73.67088608,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4582.278481,
      "Speed": 47.21518987,
      "Load": 75.82278481,
      "ThrottlePos": 64.43037975,
      "PedalPos": 73.03797468,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4544.303797,
      "Speed": 46.96202532,
      "Load": 75.44303797,
      "ThrottlePos": 63.92405063,
      "PedalPos": 72.40506329,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4506.329114,
      "Speed": 46.70886076,
      "Load": 75.06329114,
      "ThrottlePos": 63.41772152,
      "PedalPos": 71.7721519,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4468.35443,
      "Speed": 46.4556962,
      "Load": 74.6835443,
      "ThrottlePos": 62.91139241,
      "PedalPos": 71.13924051,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4430.379747,
      "Speed": 46.20253165,
      "Load": 74.30379747,
      "ThrottlePos": 62.40506329,
      "PedalPos": 70.50632911,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4392.405063,
      "Speed": 45.94936709,
      "Load": 73.92405063,
      "ThrottlePos": 61.89873418,
      "PedalPos": 69.87341772,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4354.43038,
      "Speed": 45.69620253,
      "Load": 73.5443038,
      "ThrottlePos": 61.39240506,
      "PedalPos": 69.24050633,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4316.455696,
      "Speed": 45.44303797,
      "Load": 73.16455696,
      "ThrottlePos": 60.88607595,
      "PedalPos": 68.60759494,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4278.481013,
      "Speed": 45.18987342,
      "Load": 72.78481013,
      "ThrottlePos": 60.37974684,
      "PedalPos": 67.97468354,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4240.506329,
      "Speed": 44.93670886,
      "Load": 72.40506329,
      "ThrottlePos": 59.87341772,
      "PedalPos": 67.34177215,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4202.531646,
      "Speed": 44.6835443,
      "Load": 72.02531646,
      "ThrottlePos": 59.36708861,
      "PedalPos": 66.70886076,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4164.556962,
      "Speed": 44.43037975,
      "Load": 71.64556962,
      "ThrottlePos": 58.86075949,
      "PedalPos": 66.07594937,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4126.582278,
      "Speed": 44.17721519,
      "Load": 71.26582278,
      "ThrottlePos": 58.35443038,
      "PedalPos": 65.44303797,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4088.607595,
      "Speed": 43.92405063,
      "Load": 70.88607595,
      "ThrottlePos": 57.84810127,
      "PedalPos": 64.81012658,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4050.632911,
      "Speed": 43.67088608,
      "Load": 70.50632911,
      "ThrottlePos": 57.34177215,
      "PedalPos": 64.17721519,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 4012.658228,
      "Speed": 43.41772152,
      "Load": 70.12658228,
      "ThrottlePos": 56.83544304,
      "PedalPos": 63.5443038,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3974.683544,
      "Speed": 43.16455696,
      "Load": 69.74683544,
      "ThrottlePos": 56.32911392,
      "PedalPos": 62.91139241,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3936.708861,
      "Speed": 42.91139241,
      "Load": 69.36708861,
      "ThrottlePos": 55.82278481,
      "PedalPos": 62.27848101,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3898.734177,
      "Speed": 42.65822785,
      "Load": 68.98734177,
      "ThrottlePos": 55.3164557,
      "PedalPos": 61.64556962,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3860.759494,
      "Speed": 42.40506329,
      "Load": 68.60759494,
      "ThrottlePos": 54.81012658,
      "PedalPos": 61.01265823,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3822.78481,
      "Speed": 42.15189873,
      "Load": 68.2278481,
      "ThrottlePos": 54.30379747,
      "PedalPos": 60.37974684,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3784.810127,
      "Speed": 41.89873418,
      "Load": 67.84810127,
      "ThrottlePos": 53.79746835,
      "PedalPos": 59.74683544,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3746.835443,
      "Speed": 41.64556962,
      "Load": 67.46835443,
      "ThrottlePos": 53.29113924,
      "PedalPos": 59.11392405,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3708.860759,
      "Speed": 41.39240506,
      "Load": 67.08860759,
      "ThrottlePos": 52.78481013,
      "PedalPos": 58.48101266,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3670.886076,
      "Speed": 41.13924051,
      "Load": 66.70886076,
      "ThrottlePos": 52.27848101,
      "PedalPos": 57.84810127,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3632.911392,
      "Speed": 40.88607595,
      "Load": 66.32911392,
      "ThrottlePos": 51.7721519,
      "PedalPos": 57.21518987,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3594.936709,
      "Speed": 40.63291139,
      "Load": 65.94936709,
      "ThrottlePos": 51.26582278,
      "PedalPos": 56.58227848,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3556.962025,
      "Speed": 40.37974684,
      "Load": 65.56962025,
      "ThrottlePos": 50.75949367,
      "PedalPos": 55.94936709,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3518.987342,
      "Speed": 40.12658228,
      "Load": 65.18987342,
      "ThrottlePos": 50.25316456,
      "PedalPos": 55.3164557,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3481.012658,
      "Speed": 39.87341772,
      "Load": 64.81012658,
      "ThrottlePos": 49.74683544,
      "PedalPos": 54.6835443,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3443.037975,
      "Speed": 39.62025316,
      "Load": 64.43037975,
      "ThrottlePos": 49.24050633,
      "PedalPos": 54.05063291,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3405.063291,
      "Speed": 39.36708861,
      "Load": 64.05063291,
      "ThrottlePos": 48.73417722,
      "PedalPos": 53.41772152,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3367.088608,
      "Speed": 39.11392405,
      "Load": 63.67088608,
      "ThrottlePos": 48.2278481,
      "PedalPos": 52.78481013,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3329.113924,
      "Speed": 38.86075949,
      "Load": 63.29113924,
      "ThrottlePos": 47.72151899,
      "PedalPos": 52.15189873,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3291.139241,
      "Speed": 38.60759494,
      "Load": 62.91139241,
      "ThrottlePos": 47.21518987,
      "PedalPos": 51.51898734,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3253.164557,
      "Speed": 38.35443038,
      "Load": 62.53164557,
      "ThrottlePos": 46.70886076,
      "PedalPos": 50.88607595,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3215.189873,
      "Speed": 38.10126582,
      "Load": 62.15189873,
      "ThrottlePos": 46.20253165,
      "PedalPos": 50.25316456,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3177.21519,
      "Speed": 37.84810127,
      "Load": 61.7721519,
      "ThrottlePos": 45.69620253,
      "PedalPos": 49.62025316,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3139.240506,
      "Speed": 37.59493671,
      "Load": 61.39240506,
      "ThrottlePos": 45.18987342,
      "PedalPos": 48.98734177,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3101.265823,
      "Speed": 37.34177215,
      "Load": 61.01265823,
      "ThrottlePos": 44.6835443,
      "PedalPos": 48.35443038,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3063.291139,
      "Speed": 37.08860759,
      "Load": 60.63291139,
      "ThrottlePos": 44.17721519,
      "PedalPos": 47.72151899,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 3025.316456,
      "Speed": 36.83544304,
      "Load": 60.25316456,
      "ThrottlePos": 43.67088608,
      "PedalPos": 47.08860759,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2987.341772,
      "Speed": 36.58227848,
      "Load": 59.87341772,
      "ThrottlePos": 43.16455696,
      "PedalPos": 46.4556962,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2949.367089,
      "Speed": 36.32911392,
      "Load": 59.49367089,
      "ThrottlePos": 42.65822785,
      "PedalPos": 45.82278481,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2911.392405,
      "Speed": 36.07594937,
      "Load": 59.11392405,
      "ThrottlePos": 42.15189873,
      "PedalPos": 45.18987342,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2873.417722,
      "Speed": 35.82278481,
      "Load": 58.73417722,
      "ThrottlePos": 41.64556962,
      "PedalPos": 44.55696203,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2835.443038,
      "Speed": 35.56962025,
      "Load": 58.35443038,
      "ThrottlePos": 41.13924051,
      "PedalPos": 43.92405063,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2797.468354,
      "Speed": 35.3164557,
      "Load": 57.97468354,
      "ThrottlePos": 40.63291139,
      "PedalPos": 43.29113924,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:32",
      "RPM": 2759.493671,
      "Speed": 35.06329114,
      "Load": 57.59493671,
      "ThrottlePos": 40.12658228,
      "PedalPos": 42.65822785,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2721.518987,
      "Speed": 34.81012658,
      "Load": 57.21518987,
      "ThrottlePos": 39.62025316,
      "PedalPos": 42.02531646,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2683.544304,
      "Speed": 34.55696203,
      "Load": 56.83544304,
      "ThrottlePos": 39.11392405,
      "PedalPos": 41.39240506,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2645.56962,
      "Speed": 34.30379747,
      "Load": 56.4556962,
      "ThrottlePos": 38.60759494,
      "PedalPos": 40.75949367,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2607.594937,
      "Speed": 34.05063291,
      "Load": 56.07594937,
      "ThrottlePos": 38.10126582,
      "PedalPos": 40.12658228,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2569.620253,
      "Speed": 33.79746835,
      "Load": 55.69620253,
      "ThrottlePos": 37.59493671,
      "PedalPos": 39.49367089,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2531.64557,
      "Speed": 33.5443038,
      "Load": 55.3164557,
      "ThrottlePos": 37.08860759,
      "PedalPos": 38.86075949,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2493.670886,
      "Speed": 33.29113924,
      "Load": 54.93670886,
      "ThrottlePos": 36.58227848,
      "PedalPos": 38.2278481,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2455.696203,
      "Speed": 33.03797468,
      "Load": 54.55696203,
      "ThrottlePos": 36.07594937,
      "PedalPos": 37.59493671,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2417.721519,
      "Speed": 32.78481013,
      "Load": 54.17721519,
      "ThrottlePos": 35.56962025,
      "PedalPos": 36.96202532,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2379.746835,
      "Speed": 32.53164557,
      "Load": 53.79746835,
      "ThrottlePos": 35.06329114,
      "PedalPos": 36.32911392,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2341.772152,
      "Speed": 32.27848101,
      "Load": 53.41772152,
      "ThrottlePos": 34.55696203,
      "PedalPos": 35.69620253,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2303.797468,
      "Speed": 32.02531646,
      "Load": 53.03797468,
      "ThrottlePos": 34.05063291,
      "PedalPos": 35.06329114,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2265.822785,
      "Speed": 31.7721519,
      "Load": 52.65822785,
      "ThrottlePos": 33.5443038,
      "PedalPos": 34.43037975,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2227.848101,
      "Speed": 31.51898734,
      "Load": 52.27848101,
      "ThrottlePos": 33.03797468,
      "PedalPos": 33.79746835,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2189.873418,
      "Speed": 31.26582278,
      "Load": 51.89873418,
      "ThrottlePos": 32.53164557,
      "PedalPos": 33.16455696,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2151.898734,
      "Speed": 31.01265823,
      "Load": 51.51898734,
      "ThrottlePos": 32.02531646,
      "PedalPos": 32.53164557,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2113.924051,
      "Speed": 30.75949367,
      "Load": 51.13924051,
      "ThrottlePos": 31.51898734,
      "PedalPos": 31.89873418,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2075.949367,
      "Speed": 30.50632911,
      "Load": 50.75949367,
      "ThrottlePos": 31.01265823,
      "PedalPos": 31.26582278,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2037.974684,
      "Speed": 30.25316456,
      "Load": 50.37974684,
      "ThrottlePos": 30.50632911,
      "PedalPos": 30.63291139,
      "FuelStatus": 2
    },
    {
      "time": "2024-08-21 12:33",
      "RPM": 2000.0,
      "Speed": 30.0,
      "Load": 50.0,
      "ThrottlePos": 30.0,
      "PedalPos": 30.0,
      "FuelStatus": 2
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배경 이미지
        Scaffold(
          backgroundColor: Colors.white,
        ),
        SafeArea(
          child: Scaffold(
            // floatingActionButton: FloatingActionButton(onPressed:()async{
            //
            //   for(int i = 0; i< scenarioDataList.length; i++) {
            //     await publishJsonMessage(scenarioDataList[i]);
            //     await Future.delayed(Duration(milliseconds: 1000));
            //   }
            // }),
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFEFF0F4),
            body: Column(
              children: [
                // 상단바 구현
                Flexible(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 4, top: 10, bottom: 4),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const MapScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 15,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 10, top: 10, bottom: 10),
                              child: TextField(
                                cursorColor: Colors.black, // 커서 색상 설정
                                cursorWidth: 1.5, // 커서의 두께 설정 (옵션)
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  hintText: '어디로 갈까요?',
                                  hintStyle: TextStyle(
                                    color: Color(0x98D0D0D0),
                                  ),
                                  suffixIcon: Icon(Icons.mic),
                                  suffixIconColor: Colors.blueAccent,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.blue),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(color: Color(0x98505050)),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                icon: Icon(Icons.send),
                                iconSize: 25,
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) => firstscreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 상단 바 밑 구현
                Flexible(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(),
                              Icon(Icons.home, color: Colors.grey, size: 20),
                              Text('집', style: TextStyle(color: Colors.grey)),
                              Text('|'),
                              Icon(Icons.business,
                                  color: Colors.grey, size: 20),
                              Text('회사', style: TextStyle(color: Colors.grey)),
                              SizedBox(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.monetization_on, color: Colors.yellow),
                              Text(
                                '내 포인트',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text('|'),
                              Text('무료적립'),
                              Icon(Icons.arrow_forward_ios_sharp,
                                  weight: 1.0, size: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 4개 박스 부분 시작부분
                Flexible(
                  flex: 38,
                  child: Container(
                    margin: EdgeInsets.only(top: 12), // 위쪽 마진 추가하여 간격 조정
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Row(
                              children: [
                                // 1번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 5, top: 5, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF6940F4),
                                            Color(0xFF2B5DF5),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Box(
                                        page: firstscreen(),
                                        tt: '내비',
                                        stt: '가장 빠르고 정확한 길안내',
                                        img: 'assets/car.png',
                                        col: Colors.transparent,
                                        subcol: 0xFFDCDCDC,
                                        fontcol: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                // 2번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 15, top: 5, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF314986),
                                            Color(0xFF223158),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Box(
                                        tt: '대중교통',
                                        stt: '버스, 지하철도 티맵에서',
                                        img: 'assets/bus.png',
                                        col: Colors.transparent,
                                        subcol: 0xFFDCDCDC,
                                        fontcol: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Row(
                              children: [
                                // 3번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 5, top: 5, bottom: 5),
                                    child: Box(
                                      tt: '주차',
                                      stt: '주차요금 할인받고 간편결제',
                                      img: 'assets/park.png',
                                      col: Colors.white,
                                      subcol: 0xFF7C7C7C,
                                      fontcol: Colors.black,
                                    ),
                                  ),
                                ),
                                // 4번 박스
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, right: 15, top: 5, bottom: 5),
                                    child: Box(
                                      tt: '대리운전',
                                      stt: '할인도 적립도 티나게 좋다',
                                      img: 'assets/handle.png',
                                      col: Colors.white,
                                      fontcol: Colors.black,
                                      subcol: 0xFF7C7C7C,
                                      page: MqttTestScreen(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 메인 서비스 루트 시작
                Flexible(
                  flex: 15, // flex 값을 증가시켜 높이를 더 크게 설정
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Color(0xFFEB745E)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 0),
                    child: GestureDetector(
                      onTap: () async{
                        var agree;
                        var response = await http.get(Uri.parse('http://3.35.30.20:80/setting?userId=1'));
                        if (response.statusCode == 200) {
                          var decodedresponse = jsonDecode((utf8.decode(response.bodyBytes)));
                          agree = decodedresponse['data']['agreement'];
                        } else {
                          print('파일 전송 실패: 상태 코드 ${response.statusCode}');
                        }
                        // 추가 처리 필요
                        if(agree != true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => AgreeScreen(Id: 1),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => Setting(),
                            ),
                          );
                        }
                      },
                      child: Stack(
                        children:[
                          Align(
                            alignment: Alignment(-0.8,0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(),
                                Text('SAFE-T',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold)),
                                Text('도로 위 안전 운전을 위한 서비스',
                                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                                SizedBox(),
                              ],
                            ),
                          ),

                          Align(alignment:Alignment(1, 0),child: FractionallySizedBox(heightFactor:0.9,widthFactor: 0.3,child:Image.asset('assets/shadowIcon.png'))),
                        ],
                      ),
                    ),
                  ),
                ),
                // 완전 하단 시작
                Flexible(
                  flex: 35,
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(),
                        color: Colors.transparent
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SBox(picture: 'assets/rent.png'),
                                SBox(picture: 'assets/charge.png'),
                                SBox(picture: 'assets/bike.png'),
                                SBox(picture: 'assets/buycar.png'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, bottom: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SBox(picture: 'assets/airportbus.png'),
                                SBox(picture: 'assets/around.png'),
                                SBox(picture: 'assets/subway.png'),
                                SBox(picture: 'assets/taxi.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),

            // 하단바
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Color(0xFFB2B9C1),
              iconSize: 30, // 아이콘 크기 증가
              selectedLabelStyle: TextStyle(fontSize: 14), // 선택된 항목의 텍스트 크기 증가
              unselectedLabelStyle: TextStyle(fontSize: 12), // 선택되지 않은 항목의 텍스트 크기 증가
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'T지금'),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/carlife.png',
                    width: 30, // 아이콘 크기
                    height: 30, // 아이콘 크기
                    fit: BoxFit.contain, // 아이콘 크기 조정
                  ),
                  label: '카라이프',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/daeri.png',
                    width: 30, // 아이콘 크기
                    height: 30, // 아이콘 크기
                    fit: BoxFit.contain, // 아이콘 크기 조정
                  ),
                  label: '대리운전',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/entire.png',
                    width: 30, // 아이콘 크기
                    height: 30, // 아이콘 크기
                    fit: BoxFit.contain, // 아이콘 크기 조정
                  ),
                  label: '전체',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 4분할 박스 class
class Box extends StatelessWidget {
  const Box({
    super.key,
    this.tt,
    this.stt,
    this.img,
    this.page,
    this.col,
    this.fontcol,
    this.subcol,
  });

  final String? tt;
  final String? stt;
  final String? img;
  final Widget? page;
  final Color? col;
  final int? subcol;
  final Color? fontcol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 5, left: 0, right: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: col,
      ),
      child: GestureDetector(
        onTap: () {
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page!,
              ),
            );
          } else {
            print('NoPage');
          }
        },
        child: Stack(
          children: [
            ListTile(
              title: Text(
                tt!,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: fontcol,
                ),
              ),
              subtitle: Text(stt!,
                  style: TextStyle(fontSize: 11.8, color: Color(subcol!))),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(1.2, 0.8),
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 0.5,
                  child: Image.asset(
                    img!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SBox extends StatelessWidget {
  const SBox({
    super.key,
    this.picture,
    this.text,
    this.fontSize = 20.0, // 기본 글씨 크기 설정
    // this.imageSize = 90.0, // 기본 이미지 크기 설정
  });

  final String? picture;
  final String? text;
  final double fontSize; // 글씨 크기 기본값 추가
  // final double imageSize; // 이미지 크기 기본값 추가

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child:
              FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 1,
                child: Image.asset(
                  picture!,
                  fit:BoxFit.contain,

                ),
              ),
      ),
    );
  }
}
