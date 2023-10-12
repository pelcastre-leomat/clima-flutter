import 'dart:convert';
import 'package:clima_flutter/screens/location_screen_redesign.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'error_screen.dart';
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
    getLocationData();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  //TODO Settings button should return to loading screen
  void getLocationData() async {
    try{
      var weatherData = await WeatherModel().getLocationWeather();
      Navigator.push(context,MaterialPageRoute(builder: (context) {
        return LocationScreenRedesign(locationWeather: weatherData,);
      }));
    }catch(e){
      Navigator.push(context,MaterialPageRoute(builder: (context) {
        return const ErrorScreen();
      }));
    }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SpinKitPianoWave(
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}


