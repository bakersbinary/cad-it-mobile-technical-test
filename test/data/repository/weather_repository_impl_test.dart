import 'package:cad_it_mobile_technical_test/data/model/weather_%20model.dart';
import 'package:cad_it_mobile_technical_test/data/repository/weather_repository_impl.dart';
import 'package:cad_it_mobile_technical_test/domain/entity/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/json_reader.dart';
import '../../utils/mock/mock_helper.mocks.dart';

void main() {
  late WeatherRepositoryImpl weatherRepositoryImpl;
  late MockWeatherRemoteSource mockWeatherRemoteSource;

  final response = weatherModelFromJson(
    readJson("utils/responses/current_weather_200.json"),
  );

  setUp(() {
    mockWeatherRemoteSource = MockWeatherRemoteSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(mockWeatherRemoteSource);
  });

  test("getWeather returns Right with WeatherEntity on successful response",
      () async {
    when(mockWeatherRemoteSource.getWeather())
        .thenAnswer((_) async => response);

    final result = await weatherRepositoryImpl.getWeather();

    verify(mockWeatherRemoteSource.getWeather()).called(1);

    final expected = response.toEntity();

    result.fold((exception) {}, (actualData) {
      expect(result.isRight(), true);
      expect(actualData, equals(expected));
      expect(actualData, isA<WeatherEntity>());
    });
  });
}
