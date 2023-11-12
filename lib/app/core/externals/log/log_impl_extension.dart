import 'package:logger/logger.dart';

import 'log_extension.dart';

class LogImplExtension implements LogExtension {
  final Logger _logger = Logger();

  List<String> _messages = [];

  Future<LogExtension> getInstance() async {
    info('servico de log iniciado!!!');
    return this;
  }

  @override
  void append(message) {
    _messages.add(message);
  }

  @override
  void closeAppend() {
    info(_messages.join('\n'));
    _messages = [];
  }

  @override
  void debug(message, [error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(message, [error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(message, [error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(message, [error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }
}
