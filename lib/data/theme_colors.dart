import 'package:flutter/material.dart';

class LightThemeColors {
  LightThemeColors._();

  static Color primaryColor = Color(0xff000C3D);
  static Color primaryColorDark = Colors.white;
  static Color primaryButtonColor = Color(0xFF306AFF);
  static Color primaryColorLight = Color(0xFF00D3A2);
  static Color accentColor = Color(0xff000C3D);
  static Color backgroundColor = appBackgroundColor;
  static Color zoomInOutTextColor = Colors.black.withOpacity(0.4);
  static Color scaffoldBackgroundColor = appBackgroundColor;
  static Color selectedTextColor = Colors.black;
  static Color secondaryTextColor =
      LightThemeColors.zoomInOutTextColor.withOpacity(0.7);
  static Color highlightedTextColor = Color.fromARGB(255, 255, 92, 92);
  static Color shimmerReceiverBackColor = Colors.white;
  static Color shimmerReceiverHighlightColor =
      Color.fromARGB(255, 221, 223, 221);
  static Color shimmerSenderHighlightColor = Color.fromARGB(255, 230, 232, 230);

  static const Color appBackgroundColor = Color(0xFFF2F2F2);
  static Color homeCardBackgroundColor = Color(0xFFFAFAFA);
  static Color homeCardShadowColor = Colors.black.withOpacity(0.1);
}

class DarkThemeColors {
  DarkThemeColors._();

  static Color primaryColor = Colors.white;
  static Color primaryColorDark = Colors.black;
  static Color primaryButtonColor = Color(0xFF306AFF);
  static Color primaryColorLight = Color(0xFF14F4C0);
  static Color accentColor = Color(0xff000C3D);
  static Color backgroundColor = appBackgroundColor;
  static Color zoomInOutTextColor = Colors.white.withOpacity(0.7);
  static Color scaffoldBackgroundColor = appBackgroundColor;

  static Color selectedTextColor = Colors.white;
  static Color secondaryTextColor =
      DarkThemeColors.zoomInOutTextColor.withOpacity(0.7);
  static Color highlightedTextColor = Color.fromARGB(255, 255, 92, 92);
  static Color shimmerReceiverBackColor = Color.fromARGB(255, 19, 19, 21);
  static Color shimmerReceiverHighlightColor = Color.fromARGB(255, 49, 49, 51);
  static Color shimmerSenderBackColor = Color.fromARGB(255, 60, 57, 58);
  static Color shimmerSenderHighlightColor = Color.fromARGB(255, 90, 87, 88);

  static Color parkingBackgroundColor =
      Color.fromARGB(255, 23, 21, 22); //#171516

  static const Color appBackgroundColor = Color(0xFF0F1015);
  static Color homeCardBackgroundColor = Color(0xFF1B191A);
  static Color homeCardShadowColor = Colors.black;
}

// Common widgets colors
const Color kColorAlert = Color(0xFFFE5C5C);
const Color kColorDisabledPrimary = Color(0xAA00619E);
const Color kColorEnabledPrimary = Color(0xFF00619E);
const Color kColorDisabledWhite = Colors.white30;

// App module colors
const Color kColorGreen = Colors.green;

const Color kColorTextField = Color(0xFF000C3D);

const Color kColorGreyCB = Color(0xFF000C3D);

// Login module colors
const Color kColorRed = Colors.red;

// Calendar module colors
const Color kColorCreateEventPink = Color(0xFFFE535E);
const Color kColorGreenStatus = Color(0xFF00D028);
const Color kColorDarkBlueStatus = Color(0xFF0276FF);
const Color kColorRedBorder = Color(0xFFFE4B4B);
const Color kColorSwitchInactive = Color(0xFF7D7B7C);

const Color kColorPrimary = Color(0xFF00619e);
const Color kColorAccent = Color(0xFF0A9CFB);
const Color kColorSecondary = Color(0xFF314959);
const Color kColorWhite = Colors.white;
const Color kColorBlack = Colors.black;
//const Color kColorRed = Colors.black;
const Color kColorLightBlue = Color(0xFF4A90E2);
const Color kColorMediumBlue = Color(0xFF5A93FF);
//const Color kColorDisabledPrimary = Color(0xAA00619e);
//const Color kColorDisabledWhite = Colors.white30;
//const Color kColorAlert = Color(0xFFF85359);
const Color kColorDarkGrey = Color(0xFF262324);
const Color kColorLightYellow = Color(0xFFFFC081);
const Color kColorDarkYellow = Color(0xFFFFC502);

class AppColors {
  static const Color ternaryBackground = Color.fromARGB(255, 36, 36, 43);
  static const Color secondaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryElement = Color.fromARGB(255, 167, 167, 170);
  static const Color primaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryText = Color.fromARGB(255, 252, 81, 146);
  static const Color weatherprimaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color threadReceiverBackground = Color.fromARGB(255, 19, 19, 21);
  static const Color threadSenderBackground = Color.fromARGB(255, 60, 57, 58);
  static const Color divider = Color.fromARGB(25, 255, 255, 255);
}
