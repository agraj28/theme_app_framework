import 'package:theme_app_framework/domain/entities/custom_theme_enum.dart';

abstract class ThemeRepositoryInterface {
  Future<CustomThemeEnum> getTheme();
  Future<void> setTheme(CustomThemeEnum theme);
}
