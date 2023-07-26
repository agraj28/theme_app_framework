import 'dart:ui';


import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:theme_app_framework/sharp_sell_config/src/models/sharp_sell_configuration.dart';

import 'method_channel_sharp_sell_flutter.dart';

/// The Interface that implementations of mafpay_flutter must implement.
/// Defaults to Method Channel Implementation used by Android and iOS.
abstract class SharpSellFlutterPlatform extends PlatformInterface {
  SharpSellFlutterPlatform() : super(token: _token);

  static final Object _token = Object();
  static SharpSellFlutterPlatform _instance = MethodChannelSharpSellFlutter();

  /// The default instance of [MAFPayFlutterPlatform] to use.
  static SharpSellFlutterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific implementations.
  static set instance(SharpSellFlutterPlatform instance) {
    _instance = instance;
  }

  /// Configure and Initialize MAFPay SDK with required credentials.
  Future<void> configureSDK(SharpSellConfiguration configuration) {
    throw UnimplementedError('configureSDK has not been implemented');
  }

}
