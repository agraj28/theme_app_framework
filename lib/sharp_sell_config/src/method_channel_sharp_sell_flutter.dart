import 'dart:async';

import 'package:flutter/services.dart';
import 'package:theme_app_framework/sharp_sell_config/src/sharp_sell_flutter_platform.dart';

import 'models/sharp_sell_configuration.dart';


const MethodChannel _channel = MethodChannel('sharp_sell_flutter');

class MethodChannelSharpSellFlutter extends SharpSellFlutterPlatform {
  @override
  Future<void> configureSDK(SharpSellConfiguration configuration) {
    return _channel.invokeMethod<void>('configureSDK', configuration.toJson());
  }

}
