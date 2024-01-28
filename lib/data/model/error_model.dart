import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  ErrorModel({
    required this.statusCode,
    required this.statusMessage,
  });

  late final int? statusCode;
  late final String statusMessage;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_code'] = statusCode;
    _data['status_message'] = statusMessage;
    return _data;
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
      ];
}
