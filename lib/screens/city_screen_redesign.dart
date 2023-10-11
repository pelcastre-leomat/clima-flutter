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
      body: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  textAlignVertical: TextAlignVertical.center,
                  cursorWidth: 10,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.white,
                    fillColor: Colors.black,
                  ),
                  onSubmitted: (value){
                    cityName = value;
                    Navigator.pop(
                      context,
                      value,
                    );
                  },
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
