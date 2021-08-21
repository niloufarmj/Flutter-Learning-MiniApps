import 'package:firstflutterapp/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter/material.dart';

import 'network/network.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Tehran";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forecast"),
      ),
    );
  }
}
