import 'package:cad_it_mobile_technical_test/core/widgets/dashboard_degrees.dart';
import 'package:cad_it_mobile_technical_test/core/widgets/fill_button.dart';
import 'package:cad_it_mobile_technical_test/core/widgets/simple_error.dart';
import 'package:cad_it_mobile_technical_test/core/widgets/simple_progress.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/daily/forecast_daily_cubit.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/current/weather_cubit.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/hourly/forecast_hourly_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            BlocProvider(
              create: (_) => context.read<WeatherCubit>()..getWeather(),
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 44.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text("Current Location: Bandung"),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 16.0,
                            ),
                            DashboardDegrees(
                              title: "Temperature",
                              content: "${state.weatherEntity.temp}°C",
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            DashboardDegrees(
                              title: "Humidity",
                              content: "${state.weatherEntity.humidity}%",
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            DashboardDegrees(
                              title: "Wind",
                              content: "${state.weatherEntity.windSpeed}km/h",
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is WeatherFailed) {
                    return const SimpleError(
                      message:
                          "There's something wrong, please refresh your app",
                      height: 96.0,
                    );
                  } else if (state is WeatherLoading ||
                      state is WeatherInitial) {
                    return const SimpleProgress(
                      margin: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 44.0,
                        bottom: 16.0,
                      ),
                      height: 96.0,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            BlocProvider(
              create: (_) =>
                  context.read<ForecastHourlyCubit>()..getForecastHourly(),
              child: BlocBuilder<ForecastHourlyCubit, ForecastHourlyState>(
                builder: (context, state) {
                  if (state is ForecastHourlySuccess) {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text("Forecast Hourly"),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: SimpleError(
                            message: "Feature is under development",
                            height: 96.0,
                          ),
                        ),
                      ],
                    );
                  } else if (state is ForecastHourlyFailed) {
                    return const SimpleError(
                      message:
                          "There's something wrong, please refresh your app",
                      height: 96.0,
                    );
                  } else if (state is ForecastHourlyLoading ||
                      state is ForecastHourlyInitial) {
                    return const SimpleProgress(
                      height: 96.0,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            const SizedBox(height: 16.0,),
            BlocProvider(
              create: (_) =>
                  context.read<ForecastDailyCubit>()..getForecastDaily(),
              child: BlocBuilder<ForecastDailyCubit, ForecastDailyState>(
                builder: (context, state) {
                  if (state is ForecastDailySuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text("Forecast Daily"),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: ListView.builder(
                              padding: const EdgeInsets.all(0.0),
                              shrinkWrap: true,
                              itemCount: state.forecastDailyEntity.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = state.forecastDailyEntity[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.dateTime,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Hum: ${item.humidity}% | Max: ${item.tempMax}°C | Min: ${item.tempMin}°C",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is ForecastDailyFailed) {
                    return const SimpleError(
                      message:
                          "There's something wrong, please refresh your app",
                      height: 96.0,
                    );
                  } else if (state is ForecastDailyLoading ||
                      state is ForecastDailyInitial) {
                    return const SimpleProgress(
                      height: 256.0,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: FillButton(
                      title: "Refresh",
                      onPressed: () {
                        context.read<WeatherCubit>().getWeather();
                        context.read<ForecastHourlyCubit>().getForecastHourly();
                        context.read<ForecastDailyCubit>().getForecastDaily();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: FillButton(
                      title: "Exit",
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
