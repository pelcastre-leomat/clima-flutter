import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastDay{
  final dynamic forecastDay;
  late int avgTemp;
  late IconData weatherIcon;
  late String _unformattedDate;
  late String date;

  ForecastDay({required this.forecastDay}){
    avgTemp =  forecastDay["day"]["avgtemp_c"].round();
    _unformattedDate = forecastDay["date"];
    _dayFormatter();
    _iconSelector();
  }

  void _dayFormatter(){
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_unformattedDate);
    date = DateFormat("d MMM").format(inputDate);
  }

  void _iconSelector(){


  }



}