import 'package:clima_flutter/screens/location_screen_redesign.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
