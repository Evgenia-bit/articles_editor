import 'package:artus_logger/src/log_writer.dart';

/// Base class for log strategies.
///
/// This class is an abstract base class for log strategies. A log strategy is a class
/// that provides a specific way of logging messages, exceptions, and warnings. To create
/// a custom log strategy, you should extend this class and implement the `log`, `e`, and `w`
/// methods.
abstract class LogStrategy extends LogWriter {}
