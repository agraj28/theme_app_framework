import 'package:theme_app_framework/domain/entities/custom_theme_enum.dart';
import 'package:theme_app_framework/domain/repositories/theme_repository_interface.dart';

class GetThemeUseCase {
  final ThemeRepositoryInterface repository;

  GetThemeUseCase(this.repository);

  Future<CustomThemeEnum> execute() => repository.getTheme();
}