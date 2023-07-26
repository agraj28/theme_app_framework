import 'dart:ui';

import 'package:theme_app_framework/sharp_sell_config/src/models/sharp_sell_configuration.dart';
import 'package:theme_app_framework/sharp_sell_config/src/sharp_sell_flutter_platform.dart';



class SharpSell {
  SharpSell._internal();
  factory SharpSell() => _singleton;

  static final SharpSell _singleton = SharpSell._internal();

  static var _sdkConfigured = false;

  bool get sdkConfigured => _sdkConfigured;

  /// Configure and Initialize MAFPay SDK with required credentials.
  Future<void> configureSDK(SharpSellConfiguration configuration) async {
    return await SharpSellFlutterPlatform.instance
        .configureSDK(configuration)
        .then((_) => _sdkConfigured = true);
  }


}
