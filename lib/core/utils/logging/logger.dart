import 'package:logger/logger.dart';

class CLoggerHelpler{
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug, // Set the minimum log level
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }
}