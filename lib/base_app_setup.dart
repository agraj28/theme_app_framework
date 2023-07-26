import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:theme_app_framework/base_app.dart';
import 'package:theme_app_framework/core_utils/logging_service/logging_service.dart';
import 'package:theme_app_framework/core_utils/screen_util.dart';

/// this is the entry point of the application
void baseAppSetup() {
  runZonedGuarded(
    () async {
      await basicConfigurations();
      runApp(
        const BaseApp(),
      );
    },
    (error, stack) {},
  );
}

/// all the configurations that needs to be done before the app starts should
/// be configured in this function
Future<void> basicConfigurations() async {
  /// initialising screen util
  ScreenUtil.init();

  /// initialising logging service
  //await LoggingService().init();
}
