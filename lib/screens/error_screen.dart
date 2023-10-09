import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20
        ),
        color: kPrimaryColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              "Something went wrong.\n"
                  "Check your connection\n"
                  "or API key and restart app",
              textAlign: TextAlign.center,
              style: kErrorScreenStyle,
              ),
            ],
          ),
        )
      ),
    );
  }
}
