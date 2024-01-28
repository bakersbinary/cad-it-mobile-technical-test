import 'package:cad_it_mobile_technical_test/core/remote_exception.dart';
import 'package:cad_it_mobile_technical_test/data/model/error_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "remote exception test success",
    () {
      // arrange

      // act
      final errorModel = ErrorModel(
        statusCode: 200,
        statusMessage: "success",
      );

      // assert
      expect(
        RemoteException(errorModel),
        allOf(
          isA<RemoteException>(),
          predicate<RemoteException>(
            (remoteException) {
              return remoteException.errorModel.statusCode == 200;
            },
          ),
        ),
      );
    },
  );

  test(
    "remote exception test failed",
    () {
      // arrange

      // act
      final errorModel = ErrorModel(
        statusCode: 404,
        statusMessage: "failed",
      );

      // assert
      expect(
        RemoteException(errorModel),
        allOf(
          isA<RemoteException>(),
          predicate<RemoteException>(
            (remoteException) {
              return remoteException.errorModel.statusCode == 404;
            },
          ),
        ),
      );
    },
  );
}
