import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.w600,
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
        Icons.location_city,
        color: Colors.white
    ),
    hintText: "Enter City Name",
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(10)
      ),
      borderSide: BorderSide.none,
    )
);

const TextStyle kBigTempTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 170,
  color: Colors.black,
);

const TextStyle kSmallTitleStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 15
);

const double kElementBorderRadius = 10;

const kForecastTempStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

const kForecastDayStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
