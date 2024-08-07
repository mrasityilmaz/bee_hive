part of '../../bee_hive.dart';

///
/// LoggerService for better exception logs
///
@immutable
final class _LoggerService {
  ///

  factory _LoggerService() => instance;

  const _LoggerService._internal();

  ///
  static _LoggerService instance = const _LoggerService._internal();

  static final Logger _logger = Logger();

  ///
  /// Logger function for Information Messages
  ///
  void printLog(
    String message,
  ) {
    _logger.i(
      message,
    );
  }

  ///
  /// Logger function for Error Messages
  ///
  void printErrorLog(Object e, StackTrace s) {
    _logger.t(e.toString(), stackTrace: s);
  }

  ///
  /// Logger function for try-catch blocks
  ///
  void catchLog(Object e, StackTrace s) {
    _logger.t(e, stackTrace: s, time: DateTime.now());
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: e,
        stack: s,
        library: 'bee_hive',
      ),
    );
  }
}
