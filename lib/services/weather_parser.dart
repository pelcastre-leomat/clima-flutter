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

  num getWind(){
    return weatherData["current"]["wind_kph"];
  }

  num getHumidity(){
    return weatherData["current"]["humidity"];
  }

  num getVisibility(){
    return weatherData["current"]["vis_km"];
  }

  int getMaxTemp(){
    return weatherData["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
  }

  int getMinTemp(){
    return weatherData["forecast"]["forecastday"][0]["day"]["mintemp_c"];
  }
}