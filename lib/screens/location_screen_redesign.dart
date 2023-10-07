import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationScreenRedesign extends StatefulWidget{
  // LocationScreenRedesign({required this.locationWeather});
  //
  // final locationWeather;
  @override
  _LocationScreenStateRedesign createState() => _LocationScreenStateRedesign();
}

class _LocationScreenStateRedesign extends State<LocationScreenRedesign> {
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(weatherModel.getLocationWeather());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFE142),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Icon(
                        Icons.refresh,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Paris",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.near_me,
                        color: Colors.black,
                        size: 30,
                      ),
                    )
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
                  "Sunny",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                height: 185,
                child: Text(
                  "31°",
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
                        "Daily Summary",
                        style: kSmallTitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child:Text(
                        "Now it feels like +35°, actually +31°\n"
                            "It feels hot because of irect sun.\n"
                            "Today the temperature fell in the range from +31° to +27°",
                        style: TextStyle(
                          color: Colors.black,
                          height: 1.2,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
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
                  children: const [
                    ConditionStatusColumn(
                      icon: Icons.waves,
                      conditionValue: 4,
                      toInt: true,
                      conditionUnit: "km/h",
                      condition: "Wind",
                      color: Color(0xffffe142),
                    ),
                    ConditionStatusColumn(
                      icon: Icons.water_drop_outlined,
                      conditionValue: 48,
                      toInt: true,
                      conditionUnit: "%",
                      condition: "Humidity",
                      color: Color(0xffffe142),
                    ),
                    ConditionStatusColumn(
                        icon: Icons.remove_red_eye_outlined,
                        conditionValue: 1.6,
                      toInt: false,
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
  const ConditionStatusColumn({super.key, required this.icon, required this.conditionValue, required this.toInt, required this.conditionUnit, required this.condition, required this.color});

  final IconData icon;
  final double conditionValue;
  final bool toInt;
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
          "${toInt ? conditionValue.toInt():conditionValue}${conditionUnit}",
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