import 'package:cad_it_mobile_technical_test/data/model/weather_%20model.dart';
import 'package:cad_it_mobile_technical_test/data/source/remote/weather_remote_source_impl.dart';
import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";

import '../../../utils/json_reader.dart';
import '../../../utils/mock/mock_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteSourceImpl weatherRemoteSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteSourceImpl = WeatherRemoteSourceImpl(mockHttpClient);
  });

  test("getWeather is success", () async {
    when(
      mockHttpClient.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=-6.914744&lon=107.613144&appid=342dba97611dec522d3c8135e69e5199"),
      ),
    ).thenAnswer(
      (_) async => http.Response(
          readJson("utils/responses/current_weather_200.json"), 200),
    );

    final result = await weatherRemoteSourceImpl.getWeather();

    expect(result, isA<WeatherModel>());
  });
}
