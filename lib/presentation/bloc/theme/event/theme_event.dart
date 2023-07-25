import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';

/// common event for theme bloc
abstract class ThemeEvent {}

/// Theme Change event
class ThemeChangedEvent extends ThemeEvent {
  /// [themeType] will handle which theme will be activated
  final CustomThemeEnum themeType;

  /// Constructor for theme change event
  ThemeChangedEvent(this.themeType);
}
