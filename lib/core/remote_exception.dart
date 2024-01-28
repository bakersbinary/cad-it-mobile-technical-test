import 'package:cad_it_mobile_technical_test/data/model/error_model.dart';

class RemoteException implements Exception {
  final ErrorModel errorModel;

  RemoteException(this.errorModel);
}
