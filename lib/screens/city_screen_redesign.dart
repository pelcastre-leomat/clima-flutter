import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/utilities/input_formatter.dart';
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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Input city name",
                      style: kCityInputLabelStyle,
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    cursorColor: kPrimaryColor,
                    textAlignVertical: TextAlignVertical.center,
                    cursorWidth: 10,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      UpperCaseTextFormatter()
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(50),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.black,
                    ),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 30,
                    ),
                    onSubmitted: (value){
                      cityName = value;
                      Navigator.pop(
                        context,
                        value,
                      );
                    },
                  ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
