import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_daily_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_hourly_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherUseCase {
  final WeatherRepository weatherRepository;

  WeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> getWeather() {
    return weatherRepository.getWeather();
  }

  Future<Either<Failure, List<ForecastHourlyEntity>>> getForecastHourly() {
    return weatherRepository.getForecastHourly();
  }

  Future<Either<Failure, List<ForecastDailyEntity>>> getForecastDaily() {
    return weatherRepository.getForecastDaily();
  }
}
