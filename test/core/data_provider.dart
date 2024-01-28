import 'dart:core';

import 'package:cad_it_mobile_technical_test/data/model/error_model.dart';
import 'package:cad_it_mobile_technical_test/data/model/weather_%20model.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';

class DataProvider {
  WeatherModel getWeatherModel() {
    final data = WeatherModel(
      coord: Coord(lon: 0.0, lat: 0.0),
      weather: [WeatherItem(id: 0, main: "", description: "", icon: "")],
      base: "",
      main: Main(
        temp: 0.0,
        feelsLike: 0.0,
        tempMin: 0.0,
        tempMax: 0.0,
        pressure: 0,
        humidity: 0,
      ),
      visibility: 0,
      wind: Wind(speed: 0.0, deg: 0, gust: 0.0),
      clouds: Clouds(all: 0),
      dt: 0,
      sys: Sys(type: 0, id: 0, country: "country", sunrise: 0, sunset: 0),
      timezone: 0,
      id: 0,
      name: "name",
      cod: 0,
    );

    return data;
  }

  WeatherEntity getWeatherModelToEntity() {
    return getWeatherModel().toEntity();
  }

  WeatherEntity getWeatherEntity() {
    return getWeatherModel().toEntity();
  }

  WeatherEntity? errorWeatherEntity() {
    return null;
  }

  ErrorModel getErrorModel(bool isSuccess) {
    return ErrorModel(
      statusCode: isSuccess == true ? 200 : 400,
      statusMessage: isSuccess == true ? 'success' : 'failed',
    );
  }
}
