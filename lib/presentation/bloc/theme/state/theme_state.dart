import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';

/// common theme state
abstract class ThemeState {}

/// Change theme state
class ThemeLoadedState extends ThemeState {
  /// [themeType] will handle which theme will be activated
  final CustomThemeEnum themeType;

  /// constructor for change theme state
  ThemeLoadedState(this.themeType);
}
