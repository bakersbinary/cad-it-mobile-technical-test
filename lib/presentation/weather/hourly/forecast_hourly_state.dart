part of 'forecast_hourly_cubit.dart';

@immutable
abstract class ForecastHourlyState {}

class ForecastHourlyInitial extends ForecastHourlyState {}

class ForecastHourlyLoading extends ForecastHourlyState {}

class ForecastHourlySuccess extends ForecastHourlyState {
  final List<ForecastHourlyEntity> forecastHourlyEntity;

  ForecastHourlySuccess(this.forecastHourlyEntity);
}

class ForecastHourlyFailed extends ForecastHourlyState {
  final Failure failure;

  ForecastHourlyFailed(this.failure);
}
