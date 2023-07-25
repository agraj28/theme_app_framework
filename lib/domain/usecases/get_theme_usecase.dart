import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';
import 'package:theme_architecture/domain/repositories/theme_repository_interface.dart';

class GetThemeUseCase {
  final ThemeRepositoryInterface repository;

  GetThemeUseCase(this.repository);

  Future<CustomThemeEnum> execute() => repository.getTheme();
}