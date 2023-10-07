import 'package:clima_flutter/fakeClasses/fakeNetworking.dart';

class WeatherParser{
  WeatherParser({required this.weatherData});

  final dynamic weatherData;

  String getName(){
    return weatherData["location"]["name"];
  }

  int getTemp(){
    return weatherData["current"]["temp_c"];
  }

  String getCondition(){
    return weatherData["current"]["condition"]["text"];
  }

  int getWind(){
    return weatherData["current"]["wind_kph"];
  }

  double getHumidity(){
    return weatherData["current"]["humidity"];
  }

  double getVisibility(){
    return weatherData["current"]["wind_kph"];
  }

  int getMaxTemp(){
    return weatherData["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
  }

  int getMinTemp(){
    return weatherData["forecast"]["forecastday"][0]["day"]["mintemp_c"];
  }
}