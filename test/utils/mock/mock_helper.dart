import 'package:cad_it_mobile_technical_test/data/source/remote/weather_remote_source.dart';
import 'package:cad_it_mobile_technical_test/domain/repository/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  WeatherRepository,
  WeatherRemoteSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
