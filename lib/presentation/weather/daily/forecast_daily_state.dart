part of 'forecast_daily_cubit.dart';

@immutable
abstract class ForecastDailyState {}

class ForecastDailyInitial extends ForecastDailyState {}

class ForecastDailyLoading extends ForecastDailyState {}

class ForecastDailySuccess extends ForecastDailyState {
  final List<ForecastDailyEntity> forecastDailyEntity;

  ForecastDailySuccess(this.forecastDailyEntity);
}

class ForecastDailyFailed extends ForecastDailyState {
  final Failure failure;

  ForecastDailyFailed(this.failure);
}
