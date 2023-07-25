import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';
import 'package:theme_architecture/domain/repositories/theme_repository_interface.dart';

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
