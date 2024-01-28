import 'package:cad_it_mobile_technical_test/data/model/forecast_daily_model.dart';
import 'package:cad_it_mobile_technical_test/data/model/forecast_hourly_model.dart';
import 'package:cad_it_mobile_technical_test/data/model/weather_%20model.dart';

abstract class WeatherRemoteSource {
  Future<WeatherModel> getWeather(double lat, double long);

  Future<HourlyTemperatures> getForecastHourly();

  Future<DailyTemperatures> getForecastDaily();
}
