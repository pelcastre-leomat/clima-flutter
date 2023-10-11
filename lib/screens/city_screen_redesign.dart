import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreenRedesign extends StatefulWidget {
  const CityScreenRedesign({Key? key}) : super(key: key);

  @override
  State<CityScreenRedesign> createState() => _CityScreenRedesignState();
}

class _CityScreenRedesignState extends State<CityScreenRedesign> {
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Hi!"
              ),
            ],
          ),
        ),
      ),
    );
  }
}
