import 'dart:async';
import 'dart:developer' as developer;
import 'dart:convert' as convert;

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

  static void json(String msg) {
    try {
      final dynamic data = convert.json.decode(msg);
      if (data is Map) {
        _printMap(data);
      } else if (data is List) {
        _printList(data);
      } else
        log(Level.INFO, msg);
    } catch (e) {
      log(Level.WARNING, msg);
    }
  }

  // https://github.com/Milad-Akarie/pretty_dio_logger
  static void _printMap(Map data,
      {int tabs = 1, bool isListItem = false, bool isLast = false}) {
    final bool isRoot = tabs == 1;
    final String initialIndent = _indent(tabs);
    tabs++;

    if (isRoot || isListItem) {
      log(Level.INFO, '$initialIndent');
    }

    data.keys.toList().asMap().forEach((index, dynamic key) {
      final bool isLast = index == data.length - 1;
      dynamic value = data[key];
      if (value is String) {
        value = '"$value"';
      }
      if (value is Map) {
        if (value.isEmpty)
          log(
            Level.INFO,
            '${_indent(tabs)} $key: $value${!isLast ? ',' : ''}',
          );
        else {
          log(Level.INFO, '${_indent(tabs)} $key: {');
          _printMap(value, tabs: tabs);
        }
      } else if (value is List) {
        if (value.isEmpty) {
          log(Level.INFO, '${_indent(tabs)} $key: ${value.toString()}');
        } else {
          log(Level.INFO, '${_indent(tabs)} $key: [');
          _printList(value, tabs: tabs);
          log(Level.INFO, '${_indent(tabs)} ]${isLast ? '' : ','}');
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        log(Level.INFO, '${_indent(tabs)} $key: $msg${!isLast ? ',' : ''}');
      }
    });

    log(Level.INFO, '$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  static void _printList(List list, {int tabs = 1}) {
    list.asMap().forEach((i, dynamic e) {
      final bool isLast = i == list.length - 1;
      if (e is Map) {
        if (e.isEmpty) {
          log(Level.INFO, '${_indent(tabs)}  $e${!isLast ? ',' : ''}');
        } else {
          _printMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        log(Level.INFO, '${_indent(tabs + 2)} $e${isLast ? '' : ','}');
      }
    });
  }

  static String _indent([int tabCount = 1]) => '  ' * tabCount;
}
