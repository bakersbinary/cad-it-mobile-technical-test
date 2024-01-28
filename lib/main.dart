import 'package:cad_it_mobile_technical_test/presentation/dashboard_screen.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/daily/forecast_daily_cubit.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/current/weather_cubit.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/hourly/forecast_hourly_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injector.dart' as injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  injector.inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector.locator<WeatherCubit>()),
        BlocProvider(create: (_) => injector.locator<ForecastHourlyCubit>()),
        BlocProvider(create: (_) => injector.locator<ForecastDailyCubit>()),
      ],
      child: MaterialApp(
        title: 'CAD IT Mobile Technical Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: DashboardScreen(),
      ),
    );
  }
}
