/// An interface for log writers.
///
/// This interface defines a set of methods for logging messages, exceptions, and warnings.
/// Classes that implement this interface provide the actual logging functionality.
abstract class LogWriter {
  /// Logs a simple message.
  ///
  /// This method is used to log a simple message.
  void log(Object message);

  /// Logs an exception.
  ///
  /// This method is used to log an exception. The optional [stackTrace] parameter
  /// can be used to provide additional information about the exception.
  void e(Exception exception, [StackTrace? stackTrace]);

  /// Logs a warning message.
  ///
  /// This method is used to log a warning message. The optional [exception] parameter
  /// can be used to provide additional information about the warning.
  void w(String message, [Exception? exception]);
}
