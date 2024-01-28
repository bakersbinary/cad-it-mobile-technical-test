import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  late final String temp;
  late final String humidity;
  late final String windSpeed;

  WeatherEntity({
    required this.temp,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        temp,
        humidity,
        windSpeed,
      ];
}
