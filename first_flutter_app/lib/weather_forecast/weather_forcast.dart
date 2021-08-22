import 'package:firstflutterapp/weather_forecast/model/weather_forecast_model.dart';
import 'package:firstflutterapp/weather_forecast/ui/mid_view.dart';
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
    forecastObject = getWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: ListView(
        children: [
          textFieldView(),

          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot.data)
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          )

        ]
      )
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeatherForecast();
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeatherForecast() => new Network().getWeatherForecast(cityName: _cityName);
}
