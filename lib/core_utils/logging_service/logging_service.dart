// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:theme_architecture/core_utils/device_utils.dart';
// import 'package:theme_architecture/core_utils/logging_service/contracts/logger_contract.dart';
// import 'package:theme_architecture/core_utils/logging_service/core/logging_levels.dart';
// import 'package:theme_architecture/core_utils/logging_service/core/logging_service_record.dart';
//
// /// if project have multiple server side logging then create enum for each.
// /// it will handle which server side logging is to be used while logging
// enum ServerSideLogging {
//   /// [off] no server side logging is enabled
//   off,
// }
//
// /// Loggin Service
// class LoggingService {
//   static final LoggingService _instance = LoggingService._();
//   static const JsonEncoder _prettyJsonEncoder = JsonEncoder.withIndent('  ');
//   bool _enablePrintStatement = false;
//   bool _enableLoggingService = false;
//
//   /// Factory constructor to get the instance
//   factory LoggingService() => _instance;
//
//   LoggingService._();
//
//   LoggerContract? _defaultLoggingService;
//   LoggerContract? _serverSideLoggingService;
//
//   /// This method must be called before using logging service.
//   /// It will initialize and configure logging service that will be used
//   /// later in the project
//   Future<void> init({
//     ServerSideLogging serverSideLogging = ServerSideLogging.off,
//     bool enableTempLogs = false,
//     bool enableLoggingService = false,
//   }) async {
//     _enablePrintStatement = enableTempLogs;
//     _enableLoggingService = enableLoggingService;
//
//     if (_enableLoggingService) {
//       // TODO implement local log service if needed
//       if (_defaultLoggingService != null) {
//         await _defaultLoggingService!.init();
//       }
//
//       // TODO implement server log service if needed
//       if (_serverSideLoggingService != null) {
//         await _serverSideLoggingService!.init();
//       }
//     }
//   }
//
//   /// log an event
//   /// if default logging is enabled it will log on default logging service
//   /// if server side logging is enabled it will log on server
//   /// if temporary logging is enabled it will print logs on console
//   void logMessage(
//     String message, {
//     Object? error,
//     StackTrace? stackTrace,
//     String? className,
//     String? methodName,
//   }) {
//     _logRecord(
//       LoggingLevels.severe,
//       'API',
//       message,
//       error: error,
//       stackTrace: stackTrace,
//       className: className,
//       methodName: methodName,
//     );
//   }
//
//   /// Setting user info if server side logging is available
//   void setUserInfo(String? id) {
//     if (_serverSideLoggingService != null) {
//       _serverSideLoggingService!.setUserInfo(id);
//     }
//     if (_defaultLoggingService != null) {
//       _defaultLoggingService!.setUserInfo(id);
//     }
//   }
//
//   /// Removing user info if server side logging is available
//   void unSetUserInfo() {
//     if (_serverSideLoggingService != null) {
//       _serverSideLoggingService!.unSetUserInfo();
//     }
//     if (_defaultLoggingService != null) {
//       _defaultLoggingService!.unSetUserInfo();
//     }
//   }
//
//   void _logRecord(
//     LoggingLevels level,
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     var record = LoggingServiceRecord(
//       level,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//       deviceBrand: SystemInfoHelpers.getInstance.manufacturer,
//       deviceModel: SystemInfoHelpers.getInstance.deviceModel,
//       deviceOSVersion: SystemInfoHelpers.getInstance.deviceInfoModel.appVersion,
//       platform: SystemInfoHelpers.getInstance.devicePlatform,
//       isPhysicalDevice: SystemInfoHelpers.getInstance.isPhysicalDevice,
//       appVersionName: SystemInfoHelpers.getInstance.appVersionName,
//       buildNumber: SystemInfoHelpers.getInstance.buildNumber,
//     );
//
//     if (_defaultLoggingService != null) {
//       _defaultLoggingService!.log(record);
//     }
//     if (_serverSideLoggingService != null) {
//       _serverSideLoggingService!.log(record);
//     }
//
//     if (_enablePrintStatement) {
//       _printBigLog(message: record.toString());
//     }
//   }
//
//   // Printing JSON
//
//   /// converts raw json string to human readable with proper indentation
//   /// and new line
//   ///
//   /// {"data":"","error":""} to
//   ///
//   /// {
//   ///  "data": "",
//   ///  "error": ""
//   /// }
//   ///
//   String? _prettyString(String? jsonString) {
//     if (jsonString == null) return null;
//     try {
//       return _prettyJsonEncoder.convert(json.decode(jsonString));
//     } on Exception catch (e) {
//       return 'Unable to parse\n $e';
//     }
//   }
//
//   /// print json string in human readable
//   /// [info] optional prefix of output json
//   void printPrettyJsonString({String? jsonString, String tag = '!@#'}) {
//     _printBigLog(message: '${_prettyString(jsonString)}', tag: tag);
//   }
//
//   // END of Printing JSON
//
//   void _printBigLog({String tag = '!@#', String message = ''}) {
//     message = '$tag :- $message';
//     if (_enablePrintStatement) {
//       final pattern = RegExp('.{1,800}'); //Setting 800 as size of each chunk
//       pattern.allMatches(message).forEach(
//         (element) {
//           debugPrint('${element.group(0)}');
//         },
//       );
//     }
//   }
//
//   void printLog({String tag = '!@#', String message = ''}) {
//     _printBigLog(tag: tag, message: message);
//   }
//
//   void config(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.config,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void fine(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.fine,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void finer(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.finer,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void finest(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.finest,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void info(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.info,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void severe(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.severe,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void warning(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.warning,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
//
//   void shout(
//     String featureName,
//     String message, {
//     String? className,
//     String? methodName,
//     Object? error,
//     StackTrace? stackTrace,
//   }) {
//     _logRecord(
//       LoggingLevels.shout,
//       featureName,
//       message,
//       className: className,
//       methodName: methodName,
//       error: error,
//       stackTrace: stackTrace,
//     );
//   }
// }
