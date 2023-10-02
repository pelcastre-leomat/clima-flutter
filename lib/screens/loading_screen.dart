import 'dart:convert';

import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/location.dart';


const String apiKey = "46d7418e90fd406788780155232909";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(url: "http://api.weatherapi.com/v1/current.json?key=${apiKey}&q=$latitude,${longitude}&aqi=no");
    networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}


