import 'package:theme_app_framework/domain/entities/custom_theme_enum.dart';
import 'package:theme_app_framework/domain/repositories/theme_repository_interface.dart';

class SetThemeUseCase {
  final ThemeRepositoryInterface repository;

  SetThemeUseCase(this.repository);

  Future<void> execute(CustomThemeEnum theme) => repository.setTheme(theme);
}
