import 'dart:developer';

import 'package:cad_it_mobile_technical_test/data/failure.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';
import 'package:cad_it_mobile_technical_test/domain/usecase/weather_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherUseCase weatherUseCase;

  WeatherCubit(this.weatherUseCase) : super(WeatherInitial());

  getWeather() async {
    emit(WeatherLoading());
    final position = await determinePosition();
    final address =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final data =
        await weatherUseCase.getWeather(position.latitude, position.longitude);

    data.fold(
      (failure) => emit(WeatherFailed(failure)),
      (success) => emit(
          WeatherSuccess(success, address[0].subAdministrativeArea ?? "-")),
    );
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
