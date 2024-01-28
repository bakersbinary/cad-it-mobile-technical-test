import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/forecast_daily_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/usecase/weather_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_daily_state.dart';

class ForecastDailyCubit extends Cubit<ForecastDailyState> {
  final WeatherUseCase weatherUseCase;

  ForecastDailyCubit(this.weatherUseCase) : super(ForecastDailyInitial());

  getForecastDaily() async {
    emit(ForecastDailyLoading());
    await Future.delayed(const Duration(seconds: 2));
    final data = await weatherUseCase.getForecastDaily();

    data.fold(
      (failure) => emit(ForecastDailyFailed(failure)),
      (success) => emit(ForecastDailySuccess(success)),
    );
  }
}
