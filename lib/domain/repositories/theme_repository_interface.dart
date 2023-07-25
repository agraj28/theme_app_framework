import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';

abstract class ThemeRepositoryInterface {
  Future<CustomThemeEnum> getTheme();
  Future<void> setTheme(CustomThemeEnum theme);
}
