
import 'package:firstflutterapp/parsing_json/json_parsing.dart';
import 'package:firstflutterapp/parsing_json/json_parsing_map.dart';
import 'package:firstflutterapp/weather_forecast/weather_forcast.dart';
import 'package:flutter/material.dart';

import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    outlinedButtonTheme: OutlinedButtonThemeData()
  );
}

void main() {
//  runApp(Home());
  runApp(new MaterialApp(
//    theme: ThemeData(
//      brightness: Brightness.light,
//      primaryColor: Colors.deepPurpleAccent,
//      textTheme: TextTheme(
//        headline: TextStyle(
//          color: Colors.white,
//          fontFamily: "affection",
//          fontSize: 34,
//          fontWeight: FontWeight.bold
//        ),
//        body1: TextStyle(
//          color: Colors.black54, fontSize: 20,
//        ),
//        button: TextStyle(
//          color: Colors.black,
//        ),
//      )
//    ),
//    theme: _appTheme,
    home: WeatherForecast(),
  ));
}

