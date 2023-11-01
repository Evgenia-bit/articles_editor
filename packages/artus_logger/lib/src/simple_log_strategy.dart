import 'package:artus_logger/src/log_strategy.dart';
import 'package:logger/logger.dart';

class SimpleLogStrategy implements LogStrategy {
  final logger = Logger();

  @override
  void e(Exception exception, [StackTrace? stackTrace]) {
    logger.e('Exception: $exception \n StackTrace: $stackTrace');
  }

  @override
  void log(Object message) {
    logger.i('Message: $message');
  }

  @override
  void w(String message, [Exception? exception]) {
    logger.w('Warning: $message \n Exception: $exception');
  }
}
