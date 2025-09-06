import 'package:logger/logger.dart';

import 'package:flutter_app/domain/interface/service/i_logger_service.dart';

class LoggerService implements ILoggerService{
  final Logger _logger = Logger();

  @override
  void debug(String message) {
    _logger.d(message);
  }

  @override
  void error(String message) {
    _logger.e(message);
  }

  @override
  void warning(String message) {
    _logger.w(message);
  }

}
