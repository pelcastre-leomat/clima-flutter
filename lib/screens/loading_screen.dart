import 'dart:convert';
import 'package:clima_flutter/screens/location_screen_redesign.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather().timeout(const Duration(seconds: 10));
    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return LocationScreenRedesign(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPianoWave(
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}


