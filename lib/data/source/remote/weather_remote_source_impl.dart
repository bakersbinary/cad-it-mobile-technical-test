import 'dart:convert';
import 'dart:developer';

import 'package:cad_it_mobile_technical_test/core/remote_exception.dart';
import 'package:cad_it_mobile_technical_test/data/model/error_model.dart';
import 'package:cad_it_mobile_technical_test/data/model/forecast_hourly_model.dart';
import 'package:cad_it_mobile_technical_test/data/model/forecast_daily_model.dart';
import 'package:cad_it_mobile_technical_test/data/model/weather_%20model.dart';
import 'package:cad_it_mobile_technical_test/data/source/remote/weather_remote_source.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class WeatherRemoteSourceImpl extends WeatherRemoteSource {
  final http.Client client;

  WeatherRemoteSourceImpl(this.client);

  @override
  Future<WeatherModel> getWeather() async {
    final response = await client.get(
      Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=-6.914744&lon=107.613144&appid=342dba97611dec522d3c8135e69e5199",
      ),
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("getWeather() => Response $body");

      return WeatherModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }

  @override
  Future<HourlyTemperatures> getForecastHourly() async {
    final response = await rootBundle.loadString("assets/forecast_hourly.json");
    return hourlyTemperaturesFromJson(response);
  }

  @override
  Future<DailyTemperatures> getForecastDaily() async {
    final response = await rootBundle.loadString("assets/forecast_daily.json");
    return dailyTemperaturesFromJson(response);
  }
}
