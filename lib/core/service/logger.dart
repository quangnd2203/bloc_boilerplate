import 'package:logger/logger.dart';

import '../../interface/service/logger.dart';

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
