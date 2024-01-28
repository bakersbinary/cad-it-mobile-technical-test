import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_hourly_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/usecase/weather_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_hourly_state.dart';

class ForecastHourlyCubit extends Cubit<ForecastHourlyState> {
  final WeatherUseCase weatherUseCase;

  ForecastHourlyCubit(this.weatherUseCase) : super(ForecastHourlyInitial());

  getForecastHourly() async {
    emit(ForecastHourlyLoading());
    await Future.delayed(const Duration(seconds: 2));
    final data = await weatherUseCase.getForecastHourly();

    data.fold(
      (failure) => emit(ForecastHourlyFailed(failure)),
      (success) => emit(ForecastHourlySuccess(success)),
    );
  }
}
