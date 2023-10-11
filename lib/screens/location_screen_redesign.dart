import 'package:clima_flutter/screens/city_screen_redesign.dart';
import 'package:clima_flutter/services/forecastDay.dart';
import 'package:clima_flutter/services/forecast_parser.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/services/current_day.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationScreenRedesign extends StatefulWidget{
  LocationScreenRedesign({super.key, required this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenStateRedesign createState() => _LocationScreenStateRedesign();
}

class _LocationScreenStateRedesign extends State<LocationScreenRedesign> {
  WeatherModel weatherModel = WeatherModel();
  List<ForecastDay> forecastDaysList = <ForecastDay>[];
  late CurrentDay currentDay;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){

    setState(() {
      currentDay = CurrentDay(weatherData: weatherData);
      ForecastParser forecastParser = ForecastParser(weatherData: weatherData);
      forecastDaysList = forecastParser.forecastList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                      onPressed: () async {
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      },
                    ),
                    Text(
                      currentDay.cityName,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.near_me,
                        size: 30,
                      ),
                      onPressed: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return const CityScreenRedesign();
                            }
                          )
                        );
                        if(typedName != null){
                          var weatherData = await weatherModel.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:BorderRadius.circular(20)
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 15,
                ),
                child: Text(
                  currentDay.date,
                  style: kTopDateStyle,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                currentDay.conditionText,
                style: kConditionTextStyle,
              ),
              SizedBox(
                height: 185,
                child: Text(
                  "${currentDay.temp}°",
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
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Daily Temperature Summary",
                        style: kSmallTitleStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child:Text(
                        "Current temperature of ${currentDay.temp}° feels like ${currentDay.feelsLikeTemp}°.\n"
                            "Today, temperatures will reach as high as ${currentDay.maxTemp}° and"
                            " as low as ${currentDay.minTemp}°.",
                        style: kDailySummaryTempStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30
                ),
                padding: const EdgeInsets.symmetric(
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
                      conditionValue: currentDay.wind,
                      conditionUnit: "km/h",
                      condition: "Wind",
                      color: kPrimaryColor,
                    ),
                    ConditionStatusColumn(
                      icon: Icons.water_drop_outlined,
                      conditionValue: currentDay.humidity,
                      conditionUnit: "%",
                      condition: "Humidity",
                      color: kPrimaryColor,
                    ),
                    ConditionStatusColumn(
                      icon: Icons.remove_red_eye_outlined,
                      conditionValue: currentDay.visibility,
                      conditionUnit: "km",
                      condition: "Visibility",
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
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
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for(var day in forecastDaysList)
                          ForecastCardWidget(
                            day: day,
                          ),
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
  const ForecastCardWidget({super.key, required this.day});

  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
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
            "${day.avgTemp}°",
            style: kForecastTempStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          ImageIcon(
            AssetImage("icons/${day.weatherIcon}"),
            color: Colors.black,
            size: 25,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            day.date,
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
          "${conditionValue is int ? conditionValue.toInt(): conditionValue.toDouble()}$conditionUnit",
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(
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