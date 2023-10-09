class DayWeatherParser{
  DayWeatherParser({required this.weatherData});

  final dynamic weatherData;

  String getName(){
    return weatherData["location"]["name"];
  }

  int getTemp(){
    return weatherData["current"]["temp_c"].round();
  }

  String getCondition(){
    return weatherData["current"]["condition"]["text"];
  }

  num getWind(){
    return weatherData["current"]["wind_kph"].round();
  }

  num getHumidity(){
    return weatherData["current"]["humidity"].round();
  }

  num getVisibility(){
    return weatherData["current"]["vis_km"];
  }

  num getMaxTemp(){
    return weatherData["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
  }

  num getMinTemp(){
    return weatherData["forecast"]["forecastday"][0]["day"]["mintemp_c"];
  }

  num getFeelsLikeTemp(){
    return weatherData["current"]["feelslike_c"];
  }
}