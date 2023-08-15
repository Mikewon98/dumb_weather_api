import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_weather_app/model/model.dart';

class WeatherApiCLient {
  String url =
      "https://api.open-meteo.com/v1/forecast?latitude=8.9806&longitude=38.7578&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
  Future<WeatherModel> request() async {
    Response response = await Dio().get(url);
    final parseData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parseData);
    return weather;
  }
}
