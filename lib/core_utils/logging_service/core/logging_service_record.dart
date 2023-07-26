import 'dart:async';
import 'package:theme_app_framework/core_utils/logging_service/core/logging_levels.dart';

/// A log entry representation used to propagate information from [Logger] to
/// individual handlers.
class LoggingServiceRecord {
  /// [level] will handle the severity of the log and check which log should
  /// be sent to server
  final LoggingLevels level;

  /// [message] will contains the text message that will be sent to server
  final String message;

  /// Non-string message passed to Logger.
  final Object? object;

  /// Logger where this record is stored.
  final String loggerName;

  /// Time when this record was created.
  final DateTime time;

  /// Unique sequence number greater than all log records created before it.
  final int sequenceNumber;

  static int _nextNumber = 0;

  /// Associated error (if any) when recording errors messages.
  final Object? error;

  /// Associated stackTrace (if any) when recording errors messages.
  final StackTrace? stackTrace;

  /// Zone of the calling code which resulted in this LogRecord.
  final Zone? zone;

  final String? className;

  final String? methodName;

  final String? deviceModel;

  final String? deviceBrand;

  final String? deviceOSVersion;

  final String? platform;

  final bool? isPhysicalDevice;

  final String? buildNumber;

  final String? appVersionName;

  LoggingServiceRecord(
    this.level,
    this.message,
    this.loggerName, {
    this.className,
    this.methodName,
    this.error,
    this.stackTrace,
    this.zone,
    this.object,
    this.deviceBrand,
    this.deviceModel,
    this.deviceOSVersion,
    this.platform,
    this.isPhysicalDevice,
    this.buildNumber,
    this.appVersionName,
  })  : time = DateTime.now(),
        sequenceNumber = LoggingServiceRecord._nextNumber++;

  @override
  String toString() => '[${level.name}] ${getMap().toString()}';

  Map<String, dynamic> getMap() => {
      'featureName': loggerName,
      'message': message,
      'className': className,
      'methodName': methodName,
      'error': error?.toString(),
      'stackTrace': stackTrace?.toString(),
      'timeStamp': time,
      'liveSessionSequenceNumber': sequenceNumber,
      'loggingLevel': level.name,
      'deviceBrand': deviceBrand,
      'deviceModel': deviceModel,
      'deviceOSVersion': deviceOSVersion,
      'platform': platform,
      'isPhysicalDevice': isPhysicalDevice,
      'buildNumber': buildNumber,
      'appVersionName': appVersionName,
    };
}
