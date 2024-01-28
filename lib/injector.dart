import 'package:cad_it_mobile_technical_test/data/repository/weather_repository_impl.dart';
import 'package:cad_it_mobile_technical_test/data/source/remote/weather_remote_source.dart';
import 'package:cad_it_mobile_technical_test/data/source/remote/weather_remote_source_impl.dart';
import 'package:cad_it_mobile_technical_test/domain/repository/weather_repository.dart';
import 'package:cad_it_mobile_technical_test/domain/usecase/weather_usecase.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/daily/forecast_daily_cubit.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/current/weather_cubit.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/hourly/forecast_hourly_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void inject() {
  // external
  locator.registerFactory(() => http.Client());

  // repository impl source
  locator.registerFactory<WeatherRemoteSource>(
    () => WeatherRemoteSourceImpl(
      locator(),
    ),
  );

  // repository impl domain
  locator.registerFactory<WeatherRepository>(
    () => WeatherRepositoryImpl(
      locator(),
    ),
  );

  // usecase
  locator.registerFactory(() => WeatherUseCase(locator()));

  // presentation - cubit state
  locator.registerFactory(() => WeatherCubit(locator()));
  locator.registerFactory(() => ForecastHourlyCubit(locator()));
  locator.registerFactory(() => ForecastDailyCubit(locator()));
}
