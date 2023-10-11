import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastDay{
  final dynamic forecastDay;
  late int avgTemp;
  late String weatherIcon;
  late String _unformattedDate;
  late String date;

  ForecastDay({required this.forecastDay}){
    avgTemp =  forecastDay["day"]["avgtemp_c"].round();
    weatherIcon = _iconNumGetter();
    _unformattedDate = forecastDay["date"];
    _dayFormatter();
  }

  void _dayFormatter(){
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_unformattedDate);
    date = DateFormat("d MMM").format(inputDate);
  }

  String _iconNumGetter(){
    String condition = forecastDay["day"]["condition"]["icon"];
    return condition.split("/").last;
  }



}