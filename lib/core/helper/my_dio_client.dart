import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

class MyDioClient {
  MyDioClient._();
  static Dio init() {
    return Dio(
      BaseOptions(),
    )..interceptors.add(HttpFormatter(includeResponseHeaders: false));
  }
}
