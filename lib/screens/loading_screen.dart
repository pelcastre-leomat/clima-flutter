import 'dart:convert';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const String apiKey = "46d7418e90fd406788780155232909";

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
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url: "http://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${location.latitude},${location.longitude}&aqi=no");
    var weatherData = await networkHelper.getData();

    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
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


