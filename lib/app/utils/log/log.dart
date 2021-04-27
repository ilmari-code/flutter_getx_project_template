import 'dart:async';
import 'dart:developer' as developer;

import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

class Log {
  static void configuration(Level loggerLevel) {
    Logger.root.level = loggerLevel;
    Logger.root.onRecord.listen((LogRecord rec) {
      developer.log(rec.message,
          time: rec.time,
          sequenceNumber: rec.sequenceNumber,
          level: rec.level.value,
          name: rec.loggerName,
          zone: rec.zone,
          error: rec.error,
          stackTrace: rec.stackTrace);
      if (rec.error != null) {
        developer.log(
          rec.error.toString(),
          time: rec.time,
          sequenceNumber: rec.sequenceNumber,
          level: rec.level.value,
          name: rec.loggerName,
          zone: rec.zone,
        );
      }
      if (rec.stackTrace != null) {
        var traces = rec.stackTrace.toString().split('\n');
        traces.forEach((_) {
          developer.log(
            _,
            time: rec.time,
            sequenceNumber: rec.sequenceNumber,
            level: rec.level.value,
            name: rec.loggerName,
            zone: rec.zone,
          );
        });
      }
    });
  }

  static void finest([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.FINEST, message, error, stackTrace, null, printLocation);
  }

  static void finer([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.FINER, message, error, stackTrace, null, printLocation);
  }

  static void fine([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.FINE, message, error, stackTrace, null, printLocation);
  }

  static void config([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.CONFIG, message, error, stackTrace, null, printLocation);
  }

  static void info([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.INFO, message, error, stackTrace, null, printLocation);
  }

  static void warning([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.WARNING, message, error, stackTrace, null, printLocation);
  }

  static void severe([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.SEVERE, message, error, stackTrace, null, printLocation);
  }

  static void shout([
    message,
    Object? error,
    StackTrace? stackTrace,
    bool printLocation = true,
  ]) {
    log(Level.SHOUT, message, error, stackTrace, null, printLocation);
  }

  static void log(Level level,
      [message,
      Object? error,
      StackTrace? stackTrace,
      Zone? zone,
      bool printLocation = true]) {
    var frame = Trace.current().frames[2];
    var location = frame.location;
    var member = frame.member;
    if (printLocation) {
      message = _format(location, message);
    }
    Logger(member!).log(level, message, error, stackTrace, zone);
  }

  static String _format(location, message) {
    if (message == null) {
      return '($location)';
    } else {
      return '($location) $message';
    }
  }
}
