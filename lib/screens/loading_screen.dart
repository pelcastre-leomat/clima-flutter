import 'package:flutter/material.dart';
import 'package:clima_flutter/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
  }
  
  void getData() async{
    http.Response response = await http.get(Uri.parse("http://api.weatherapi.com/v1/current.json?key=46d7418e90fd406788780155232909&q=${latitude},${longitude}&aqi=no"));
    if(response.statusCode == 200){
      String data = response.body;
      print(response.body);
    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}
