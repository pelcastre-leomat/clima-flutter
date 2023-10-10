import 'package:intl/intl.dart';

class CurrentDay{
  CurrentDay({required this.weatherData}){
    cityName = weatherData["location"]["name"];
    date = DateFormat("EEEE d MMMM").format(DateTime.now());
    temp =  weatherData["current"]["temp_c"].round();
    conditionText = weatherData["current"]["condition"]["text"];
    wind = weatherData["current"]["wind_kph"].round();
    humidity = weatherData["current"]["humidity"].round();
    visibility = weatherData["current"]["vis_km"];
    maxTemp = weatherData["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
    minTemp = weatherData["forecast"]["forecastday"][0]["day"]["mintemp_c"];
    feelsLikeTemp = weatherData["current"]["feelslike_c"];
  }

  final dynamic weatherData;
  late String date;
  late int temp;
  late String cityName;
  late String conditionText;
  late num wind;
  late num humidity;
  late num visibility;
  late num maxTemp;
  late num minTemp;
  late num feelsLikeTemp;
}