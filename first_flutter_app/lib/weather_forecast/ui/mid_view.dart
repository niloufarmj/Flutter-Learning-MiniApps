import 'package:firstflutterapp/weather_forecast/model/weather_forecast_model.dart';
import 'package:firstflutterapp/weather_forecast/util/forecast_util.dart';
import 'package:flutter/cupertino.dart';

Widget midView(snapshotData) {
  var forecastList = snapshotData.list;
  var city = snapshotData.city.name;
  var country = snapshotData.city.country;
  var date_time = Util.getFormattedDate(new DateTime.fromMicrosecondsSinceEpoch(forecastList[0].dt));
  Container midViewContainer = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$city, $country", style: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: "blogger", fontSize: 27
        ),),
        Text(date_time)
      ],
    )
  );

  return midViewContainer;
}