import 'package:flutter_test/flutter_test.dart';

import '../../core/data_provider.dart';

void main() {
  late DataProvider dataProvider;

  setUp(() {
    dataProvider = DataProvider();
  });

  test("WEATHER_MODEL_SUCCESS", () {
    final actual = dataProvider.getWeatherModelToEntity();
    final expected = dataProvider.getWeatherEntity();

    expect(actual, expected);
  });

  test("WEATHER_MODEL_FAILED", () {
    final actual = dataProvider.errorWeatherEntity();

    expect(actual, null);
  });
}
