import 'package:hive/hive.dart';
import 'package:task/core/config/error/data_missing_exception.dart';
import 'package:task/core/config/error/failure.dart';
import 'package:task/core/services/logger_service.dart';

class ErrorFailure extends Failure {
  ErrorFailure._({
    this.error,
    this.message,
  });
  factory ErrorFailure.decode(
    Error? error,
  ) {
    LoggerService.error(error.toString(), name: 'FAILURE[ERROR]');
    LoggerService.error((error?.stackTrace).toString(), name: 'FAILURE[ERROR][TRACE]');
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }
  final Error? error;
  @override
  final String? message;
}

class HiveFailure extends Failure {
  HiveFailure._({
    this.error,
    this.message,
  });
  factory HiveFailure.decode(HiveError? error) {
    LoggerService.error(error.toString(), name: 'FAILURE[HIVE]');
    LoggerService.error((error?.message).toString(), name: 'FAILURE[HIVE][MESSAGE]');
    LoggerService.error((error?.stackTrace).toString(), name: 'FAILURE[HIVE][TRACE]');
    return HiveFailure._(
      error: error,
      message: error?.message,
    );
  }
  final HiveError? error;
  @override
  final String? message;
}

class DataMissingFailure extends Failure {
  factory DataMissingFailure.decode(DataMissingException? error) {
    LoggerService.error(error.toString(), name: 'FAILURE[DATAMISSING]');
    return DataMissingFailure._(
      error: error,
      message: error?.message,
    );
  }
  DataMissingFailure._({
    this.error,
    this.message,
  });
  final DataMissingException? error;
  @override
  final String? message;
}
