import 'package:clima_flutter/services/forecastDay.dart';

class ForecastParser{
  late dynamic _forecastWeatherData;
  late int _nDays;
  late List<ForecastDay> forecastList;

  ForecastParser({required weatherData}){
    _forecastWeatherData = weatherData["forecast"]["forecastday"];
    _nDays = _forecastWeatherData.length;
    forecastList = <ForecastDay>[];
    _forecastListMaker();
  }

  _forecastListMaker(){
    for(var i = 0;i<_nDays;i++){
      forecastList.add(ForecastDay(forecastDay: _forecastWeatherData[i]));
    }
  }



  //Return day objects
}