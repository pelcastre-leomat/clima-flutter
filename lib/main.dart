import 'package:clima_flutter/screens/location_screen_redesign.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
