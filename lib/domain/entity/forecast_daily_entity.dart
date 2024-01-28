import 'package:equatable/equatable.dart';

class ForecastDailyEntity extends Equatable {
  late final String dateTime;
  late final String tempMax;
  late final String tempMin;
  late final String humidity;

  ForecastDailyEntity({
    required this.dateTime,
    required this.tempMax,
    required this.tempMin,
    required this.humidity,
  });

  @override
  List<Object?> get props => [
        dateTime,
        tempMax,
        tempMin,
        humidity,
      ];
}
