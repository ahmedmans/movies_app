import 'package:movies_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocelDataBaseException implements Exception {
  final String message;

  LocelDataBaseException({required this.message});
}
