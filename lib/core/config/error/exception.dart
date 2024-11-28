import 'package:flutter/services.dart';
import 'package:task/core/config/error/failure.dart';
import 'package:task/core/services/logger_service.dart';

class ExceptionFailure extends Failure {
  factory ExceptionFailure.decode(Exception? error) {
    LoggerService.error(error.toString(), name: 'FAILURE[EXCEPTION]');
    return ExceptionFailure._(
      error: error,
      message: error.toString(),
    );
  }
  ExceptionFailure._({
    this.error,
    this.message,
  });
  @override
  final String? message;
  final Exception? error;
}

class PlatformFailure extends Failure {
  PlatformFailure._({
    this.message,
    this.error,
  });

  factory PlatformFailure.decode(PlatformException? error) {
    LoggerService.error((error).toString(),
        name: 'FAILURE[PLATFORM][EXCEPTION]');
    LoggerService.error((error?.message).toString(),
        name: 'FAILURE[PLATAFORM][MESSAGE]');
    LoggerService.error((error?.stacktrace).toString(),
        name: 'FAILURE[PLATFORM][TRACE]');
    return PlatformFailure._(
      error: error,
      message: error?.message,
    );
  }
  @override
  final String? message;
  final PlatformException? error;
}
