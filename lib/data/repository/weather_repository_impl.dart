import 'dart:io';

import 'package:cad_it_mobile_technical_test/core/remote_exception.dart';
import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/data/source/remote/weather_remote_source.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_daily_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_hourly_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteSource weatherRemoteSource;

  WeatherRepositoryImpl(this.weatherRemoteSource);

  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    try {
      final response = await weatherRemoteSource.getWeather();
      final entity = response.toEntity();
      return Right(entity);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(
        ServerFailure(
          "Please check your internet connection!",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ForecastHourlyEntity>>>
      getForecastHourly() async {
    try {
      final response = await weatherRemoteSource.getForecastHourly();
      final entity = response.list.map((e) => e.toEntity()).toList();
      return Right(entity);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(
        ServerFailure(
          "Please check your internet connection!",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ForecastDailyEntity>>> getForecastDaily() async {
    try {
      final response = await weatherRemoteSource.getForecastDaily();
      final entity = response.list.map((e) => e.toEntity()).toList();
      return Right(entity);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(
        ServerFailure(
          "Please check your internet connection!",
        ),
      );
    }
  }
}