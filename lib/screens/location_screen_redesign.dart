import 'package:clima_flutter/services/forecast_parser.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/services/day_weather_parser.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationScreenRedesign extends StatefulWidget{
  LocationScreenRedesign({required this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenStateRedesign createState() => _LocationScreenStateRedesign();
}

class _LocationScreenStateRedesign extends State<LocationScreenRedesign> {
  WeatherModel weatherModel = WeatherModel();
  int temp = 0;
  num wind = 0;
  num humidity = 0;
  num visibility = 0;
  num maxTemp = 0;
  num minTemp = 0;
  num feelsLikeTemp = 0;
  String conditionText = "";
  String weatherIcon = "";
  String weatherMessage = "";
  String cityName = "New York";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    DayWeatherParser dayWeatherParser = DayWeatherParser(weatherData: weatherData);
    ForecastParser forecastParser = ForecastParser(weatherData: weatherData);

    setState(() {
      if(weatherData == null){
        temp= 0;
        weatherIcon = "Error";
        weatherMessage = "Unable to fetch weather data";
        cityName = "";
        return;
      }
      temp = dayWeatherParser.getTemp();
      cityName = dayWeatherParser.getName();
      // var condition = weatherParser.getCondition();
      conditionText = dayWeatherParser.getCondition();
      wind = dayWeatherParser.getWind();
      humidity = dayWeatherParser.getHumidity();
      visibility = dayWeatherParser.getVisibility();
      maxTemp = dayWeatherParser.getMaxTemp();
      minTemp = dayWeatherParser.getMinTemp();
      feelsLikeTemp = dayWeatherParser.getFeelsLikeTemp();

      print(forecastParser.getNDays());

      // weatherIcon = weatherModel.getWeatherIcon(condition);
      // weatherMessage = weatherModel.getMessage(temp.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFE142),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                      onPressed: () async {
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      },
                    ),
                    Container(
                      child: Text(
                        cityName,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.near_me,
                        size: 30,
                      ),
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:BorderRadius.circular(20)
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 15,
                ),
                child: Text(
                  "Friday 20 January",
                  style: TextStyle(
                    color: Color(0xffFFE142),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  conditionText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                height: 185,
                child: Text(
                  "${temp}°",
                  style: kBigTempTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Daily Temperature Summary",
                        style: kSmallTitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      child:Text(
                        "Current temperature of ${temp} feels like ${feelsLikeTemp}.\n"
                            "Temperatures will reach as high as ${maxTemp}° and"
                            " as low as ${minTemp}°",
                        style: kDailySummaryTempStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 30
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(kElementBorderRadius),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConditionStatusColumn(
                      icon: Icons.waves,
                      conditionValue: wind,
                      conditionUnit: "km/h",
                      condition: "Wind",
                      color: Color(0xffffe142),
                    ),
                    ConditionStatusColumn(
                      icon: Icons.water_drop_outlined,
                      conditionValue: humidity,
                      conditionUnit: "%",
                      condition: "Humidity",
                      color: Color(0xffffe142),
                    ),
                    ConditionStatusColumn(
                      icon: Icons.remove_red_eye_outlined,
                      conditionValue: visibility,
                      conditionUnit: "km",
                      condition: "Visibility",
                      color: Color(0xffffe142),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                child: Column(
                  textDirection: TextDirection.ltr,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Weekly Forecast",
                          style: kSmallTitleStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ForecastCardWidget(),
                        ForecastCardWidget(),
                        ForecastCardWidget(),
                        ForecastCardWidget(),
                      ],
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }

}

class ForecastCardWidget extends StatelessWidget {
  const ForecastCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 15, 8, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kElementBorderRadius),
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),
      child: Column(
        children: [
          Text(
            "26°",
            style: kForecastTempStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Icon(
            Icons.sunny,
            color: Colors.black,
            size: 15,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "21 Jan",
            style: kForecastDayStyle,
          )
        ],
      ),
    );
  }
}

class ConditionStatusColumn extends StatelessWidget {
  const ConditionStatusColumn({super.key, required this.icon, required this.conditionValue, required this.conditionUnit, required this.condition, required this.color});

  final IconData icon;
  final num conditionValue;
  final String conditionUnit;
  final String condition;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${conditionValue is int ? conditionValue.toInt(): conditionValue.toDouble()}${conditionUnit}",
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          condition,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}