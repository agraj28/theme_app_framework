import 'package:flutter/material.dart';
import 'package:theme_app_framework/core_utils/app_constants.dart';
import 'package:theme_app_framework/data/base_theme.dart';
import 'package:theme_app_framework/data/theme_colors.dart';

class ThemeDataColors extends BaseTheme {
  static final ThemeDataColors _instance = ThemeDataColors._();

  ThemeDataColors._();

  factory ThemeDataColors() => _instance;

  @override
  ThemeData? get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      brightness: brightness,
      primaryColor: DarkThemeColors.primaryColor,
      primaryColorDark: DarkThemeColors.primaryColorDark,
      primaryColorLight: DarkThemeColors.primaryColorLight,
      canvasColor: DarkThemeColors.primaryColorDark.withOpacity(0.4),
      // Card background
      disabledColor: Colors.red,
      //DarkThemeColors.zoomInOutTextColor,
      dialogBackgroundColor: Colors.grey.shade200.withOpacity(0.2),
      backgroundColor: DarkThemeColors.backgroundColor,
      highlightColor: DarkThemeColors.shimmerReceiverBackColor,
      splashColor: DarkThemeColors.shimmerSenderBackColor,
      hoverColor: DarkThemeColors.shimmerReceiverHighlightColor,
      focusColor: DarkThemeColors.shimmerSenderHighlightColor,
      scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
      cardColor: null,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: LightThemeColors.primaryButtonColor),
      buttonTheme:
          ButtonThemeData(buttonColor: LightThemeColors.primaryButtonColor),
      colorScheme: null,
    );
  }

  @override
  ThemeData? get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      brightness: brightness,
      primaryColor: null,
      primaryColorDark: LightThemeColors.primaryColorDark,
      primaryColorLight: LightThemeColors.primaryColorLight,
      canvasColor: LightThemeColors.primaryColorDark,
      // Card background
      disabledColor: Colors.blue,
      // LightThemeColors.zoomInOutTextColor,
      dialogBackgroundColor: Colors.grey.shade200.withOpacity(0.2),
      backgroundColor: LightThemeColors.backgroundColor,
      highlightColor: LightThemeColors.primaryColorDark.withOpacity(0.5),
      hoverColor: LightThemeColors.primaryColor.withOpacity(0.7),
      splashColor: LightThemeColors.primaryColorDark.withOpacity(0.5),
      focusColor: LightThemeColors.primaryColor.withOpacity(0.7),
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
      cardColor: null,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: LightThemeColors.primaryButtonColor),
      colorScheme: null,
    );
  }

  @override
  ThemeData? get autoTheme {
    var now = DateTime.now().toLocal();

    /// Dark theme start time
    var darkThemeStartTime = AppConstants.getDarkThemeStartTime(now);

    /// Dark theme to Light theme switch time
    var darkThemeEndTime = AppConstants.getDarkThemeEndTime(now);

    /// if the current time is between 6am to 7pm them light theme else dark
    /// theme
    if (now.isAfter(darkThemeEndTime) && now.isBefore(darkThemeStartTime)) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }
}
