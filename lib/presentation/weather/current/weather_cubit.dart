import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/usecase/weather_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherUseCase weatherUseCase;

  WeatherCubit(this.weatherUseCase) : super(WeatherInitial());

  getWeather() async {
    emit(WeatherLoading());
    await Future.delayed(const Duration(seconds: 2));
    final data = await weatherUseCase.getWeather();

    data.fold(
      (failure) => emit(WeatherFailed(failure)),
      (success) => emit(WeatherSuccess(success)),
    );
  }
}
