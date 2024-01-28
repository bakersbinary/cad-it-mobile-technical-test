import 'package:equatable/equatable.dart';

class ForecastHourlyEntity extends Equatable {
  late final String dateTime;
  late final String temp;

  ForecastHourlyEntity({
    required this.dateTime,
    required this.temp,
  });

  @override
  List<Object?> get props => [
        dateTime,
        temp,
      ];
}
