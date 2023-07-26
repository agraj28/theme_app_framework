import 'package:theme_app_framework/domain/entities/custom_theme_enum.dart';
import 'package:theme_app_framework/domain/repositories/theme_repository_interface.dart';

class ThemeRepository implements ThemeRepositoryInterface {
  CustomThemeEnum? themeType;

  @override
  Future<CustomThemeEnum> getTheme() async =>
      themeType ?? CustomThemeEnum.light;

  @override
  Future<void> setTheme(CustomThemeEnum themeType) async {
    themeType = themeType;
  }
}
