import 'package:flutter/material.dart';

/// Common tab bar model
class CommonTabBarModel {
  /// tab title
  String tabTitle;

  /// icon to display when tab is selected
  Widget? activeIcon;

  /// icon to display when tab is not selected
  Widget? inActiveIcon;

  /// Common tab bar model
  CommonTabBarModel({
    this.tabTitle = '',
    this.activeIcon,
    this.inActiveIcon,
  });
}
