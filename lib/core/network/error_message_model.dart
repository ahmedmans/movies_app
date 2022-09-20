import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  factory ErrorMessageModel.fromjson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusMessage: json["status_message"],
      statusCode: json[" status_code"],
      success: json["success"],
    );
  }

  @override
  List<Object?> get props => [
        statusMessage,
        statusCode,
        success,
      ];
}
