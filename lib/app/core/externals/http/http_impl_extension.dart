import 'package:dio/dio.dart';
import 'package:weather_app/app/core/externals/http/interceptor/dio_interceptor.dart';

import 'http_extension.dart';

class HttpImplExtension implements HttpExtension {
  final Dio _client;
  final CustomInterceptors _customInterceptors;

  HttpImplExtension({required Dio dio, required CustomInterceptors interceptors})
      : _client = dio,
        _customInterceptors = interceptors {
    _client.interceptors.add(_customInterceptors);
  }

  @override
  Future<HttpResponse> delete(String url,
      {required Map<String, dynamic> body, Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await _client.get(url, options: Options(headers: headers));
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> patch(String url,
      {required Map<String, dynamic> body, Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body, Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put(String url,
      {required Map<String, dynamic> body, Map<String, String>? headers}) {
    throw UnimplementedError();
  }
}
