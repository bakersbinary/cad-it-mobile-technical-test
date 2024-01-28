import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_daily_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_hourly_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather(double lat, double long);

  Future<Either<Failure, List<ForecastHourlyEntity>>> getForecastHourly();

  Future<Either<Failure, List<ForecastDailyEntity>>> getForecastDaily();
}
