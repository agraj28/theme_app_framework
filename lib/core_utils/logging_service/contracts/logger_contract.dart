import '../core/logging_service_record.dart';

/// If Server side logging is enabled then this contract needs to be
/// implemented and implementations for the following methods should be
/// provided
abstract class LoggerContract {
  /// To initialise logging service
  /// Override this method and configure server side configurations to get logs
  /// on server side
  Future<void> init();

  /// To uniquely identify user provide user details to server
  void setUserInfo(String? id);

  /// To remove user related information and receive logs from user without
  /// knowing the identity of user unset the user info
  void unSetUserInfo();

  /// Override this method and write the implementation of server side logging
  void log(LoggingServiceRecord record);
}
