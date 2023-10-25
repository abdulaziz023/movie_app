import 'package:dio/dio.dart';

enum Method {
  get,
  post,
  put,
  patch,
  delete,
}

class ApiService {
  static const ApiService _instance = ApiService._();

  factory ApiService() => _instance;

  const ApiService._();

  static final Dio _dio = Dio(
    BaseOptions(),
  );

  Future<String> request(
    String path, {
    Method method = Method.get,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    Object? body,
  }) async {
    return Future.value(null);
  }
}
