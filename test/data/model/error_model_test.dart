import 'package:cad_it_mobile_technical_test/data/model/error_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/data_provider.dart';

void main() {
  late DataProvider dataProvider;

  setUp(
    () {
      dataProvider = DataProvider();
    },
  );

  test(
    "get error model failed",
    () {
      // arrange

      // act
      final actual = dataProvider.getErrorModel(false);
      final expected = ErrorModel(
        statusCode: 400,
        statusMessage: 'failed',
      );

      // assert
      expect(actual.statusCode, expected.statusCode);
      expect(actual.statusMessage, expected.statusMessage);
    },
  );
}
