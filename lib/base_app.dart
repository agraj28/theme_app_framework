import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_architecture/data/repositories/theme_repository.dart';
import 'package:theme_architecture/data/theme_data.dart';
import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';
import 'package:theme_architecture/domain/usecases/get_theme_usecase.dart';
import 'package:theme_architecture/domain/usecases/set_theme_usecase.dart';
import 'package:theme_architecture/presentation/bloc/theme/provider/theme_bloc.dart';
import 'package:theme_architecture/presentation/bloc/theme/state/theme_state.dart';
import 'package:theme_architecture/presentation/common_button/my_app.dart';

/// base widget, which will be the base widget for the application
class BaseApp extends StatelessWidget {
  /// base app constructor
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeRepository = ThemeRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(
            GetThemeUseCase(themeRepository),
            SetThemeUseCase(themeRepository),
          ),
        ),
      ],
      child: _AppProviders(
        child: MyApp(),
      ),
    );
  }
}

class _AppProviders extends StatelessWidget {
  final Widget child;

  const _AppProviders({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder(
        bloc: BlocProvider.of<ThemeBloc>(context),
        builder: (context, state) {
          var themeData = ThemeDataColors().lightTheme;
          if (state is ThemeLoadedState) {
            switch (state.themeType) {
              case CustomThemeEnum.light:
                themeData = ThemeDataColors().lightTheme;
                break;
              case CustomThemeEnum.dark:
                themeData = ThemeDataColors().darkTheme;
                break;
              case CustomThemeEnum.autoTheme:
                themeData = ThemeDataColors().autoTheme;
                break;
            }
          }
          return MaterialApp(
            theme: themeData,
            home: child,
          );
        },
      );
}
