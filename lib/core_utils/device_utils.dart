// import 'dart:core';
// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// /// to obtain device information
// class SystemInfoHelpers {
//   SystemInfoHelpers._privateConstructor();
//
//   /// System info helper instance
//   static final SystemInfoHelpers getInstance =
//       SystemInfoHelpers._privateConstructor();
//
//   late String _buildNumber, _appVersionName, _appId;
//   late DeviceInfoModel _deviceInfo;
//
//   /// initializing system info helper
//   Future<void> init() async {
//     var packageInfo = await PackageInfo.fromPlatform();
//     _buildNumber = packageInfo.buildNumber; // 255 AKA version code
//     _appVersionName = packageInfo.version; //1.0.1
//     _appId = packageInfo.packageName; //com.example.app
//     _deviceInfo = await _getDeviceInfo();
//   }
//
//   DeviceInfoModel get deviceInfoModel => _deviceInfo;
//
//   String get deviceModel => _deviceInfo.model;
//
//   String get deviceId => _deviceInfo.id;
//
//   String get devicePlatform => _deviceInfo.platform;
//
//   String get buildNumber => _buildNumber;
//
//   String get appVersionName => _appVersionName;
//
//   String get appId => _appId;
//
//   bool get isPhysicalDevice => _deviceInfo.isPhysicalDevice;
//
//   String get manufacturer => _deviceInfo.deviceManufacturer;
//
//   /// Method to get android device information on which app is running
//   Future<AndroidDeviceInfo> _androidDeviceInfo() async {
//     var plugin = DeviceInfoPlugin();
//     return plugin.androidInfo;
//   }
//
//   /// Method to get iOS device information on which app is running
//   Future<IosDeviceInfo> _iosDeviceInfo() async {
//     var plugin = DeviceInfoPlugin();
//     return plugin.iosInfo;
//   }
//
//   Future<DeviceInfoModel> _getDeviceInfo() async {
//     var model = DeviceInfoModel();
//     if (Platform.isAndroid) {
//       var device = await _androidDeviceInfo();
//       model
//         ..id = device.id
//         ..isPhysicalDevice = device.isPhysicalDevice
//         ..model = device.model
//         ..deviceManufacturer = device.manufacturer
//         ..appVersion = device.version.release
//         ..platform = 'Android'
//         ..androidSdk = device.version.sdkInt.toString();
//     }
//
//     if (Platform.isIOS) {
//       var device = await _iosDeviceInfo();
//       model
//         ..id = device.identifierForVendor ?? ''
//         ..isPhysicalDevice = device.isPhysicalDevice
//         ..model = device.model
//         ..deviceManufacturer = device.name
//         ..systemName = device.systemName
//         ..platform = 'IOS'
//         ..appVersion = device.systemVersion;
//     }
//     return model;
//   }
// }
//
// class DeviceInfoModel {
//   String id = '';
//   bool isPhysicalDevice = false;
//   String deviceManufacturer = '';
//   String model = '';
//   String platform = '';
//   String version = '';
//   String systemName = '';
//   String appVersion = '';
//   String androidSdk = '';
//
//   Map<String, dynamic> toJsonMap() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['isPhysicalDevice'] = isPhysicalDevice;
//     data['deviceManufacturer'] = deviceManufacturer;
//     data['model'] = model;
//     data['platform'] = platform;
//     data['version'] = version;
//     data['systemName'] = systemName;
//     data['appVersion'] = appVersion;
//     data['androidSdk'] = androidSdk;
//     return data;
//   }
// }
