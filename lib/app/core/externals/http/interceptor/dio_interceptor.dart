import 'package:dio/dio.dart';
import 'package:weather_app/app/core/externals/log/log_extension.dart';

class CustomInterceptors extends Interceptor {
  final LogExtension _log;

  CustomInterceptors({required LogExtension log}) : _log = log;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log.append(
        '############### ${response.requestOptions.method.toUpperCase()} ###############');
    _log.append('URL: ${response.requestOptions.path}');
    _log.append('StatusCode: ${response.statusCode}');
    _log.append('BODY: ${response.data}');
    _log.append('HEADERS: ${response.headers}');
    _log.append('RESPONSE: $response');
    _log.append('######################################');
    _log.closeAppend();
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    _log.append(
        '############### ${err.requestOptions.method.toUpperCase()} ###############');
    _log.append('URL: ${err.requestOptions.path}');
    _log.append('StatusCode: ${err.response?.statusCode}');
    _log.append('BODY: ${err.requestOptions.data}');
    _log.append('HEADERS: ${err.response?.headers}');
    _log.append('RESPONSE: ${err.response}');
    _log.append('######################################');
    _log.closeAppend();
    super.onError(err, handler);
  }
}
