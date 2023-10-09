class ForecastParser{
  ForecastParser({required this.weatherData});

  final dynamic weatherData;

  int getNDays(){
    return weatherData["forecast"]["forecastday"].length;
  }

  //Return day objects
}