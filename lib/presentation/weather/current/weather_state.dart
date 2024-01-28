part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherEntity weatherEntity;

  WeatherSuccess(this.weatherEntity);
}

class WeatherFailed extends WeatherState {
  final Failure failure;

  WeatherFailed(this.failure);
}
