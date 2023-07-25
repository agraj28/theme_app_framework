/// All the constants that will be used inside the app
class AppConstants {
  AppConstants._();

  /// Dark theme start time (in 24 hour format evening) 7 pm that is 19 hours
  static DateTime getDarkThemeStartTime(DateTime now) =>
      DateTime(now.year, now.month, now.day, 19);

  /// Dark theme to Light switch time (in 24 hour format) at 6 am that is
  /// 6 hours
  static DateTime getDarkThemeEndTime(DateTime now) =>
      DateTime(now.year, now.month, now.day, 6);
}
