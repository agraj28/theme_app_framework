import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_architecture/core_utils/app_constants.dart';
import 'package:theme_architecture/domain/entities/custom_theme_enum.dart';
import 'package:theme_architecture/domain/usecases/get_theme_usecase.dart';
import 'package:theme_architecture/domain/usecases/set_theme_usecase.dart';
import 'package:theme_architecture/presentation/bloc/theme/event/theme_event.dart';
import 'package:theme_architecture/presentation/bloc/theme/state/theme_state.dart';

/// theme bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;
  Timer? autoThemeTime;

  /// constructor for theme bloc
  ThemeBloc(this.getThemeUseCase, this.setThemeUseCase)
      : super(
          ThemeLoadedState(
            CustomThemeEnum.light,
          ),
        ) {
    on<ThemeChangedEvent>(_mapThemeChangedEventToState);
  }

  FutureOr<void> _mapThemeChangedEventToState(
    ThemeChangedEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      autoThemeTime?.cancel();
      if (event.themeType != CustomThemeEnum.autoTheme) {
        autoThemeTime = null;
      } else {
        var durationLeftForNextTheme = _calculateTimeLeftToChangeTheme();
        autoThemeTime = Timer(
          durationLeftForNextTheme,
          () {
            add(
              ThemeChangedEvent(
                CustomThemeEnum.autoTheme,
              ),
            );
          },
        );
      }
      await setThemeUseCase.execute(event.themeType);
      emit(ThemeLoadedState(event.themeType));
    } catch (e) {
      // Handle error
    }
  }

  Duration _calculateTimeLeftToChangeTheme() {
    var now = DateTime.now();

    /// Dark theme start time
    var darkThemeStartTime = AppConstants.getDarkThemeStartTime(now);

    /// Dark theme to Light theme switch time
    var darkThemeEndTime = AppConstants.getDarkThemeEndTime(now);

    Duration timeLeft;

    /// calculate time left when theme will be changed
    if (now.isBefore(darkThemeEndTime)) {
      timeLeft = darkThemeEndTime.difference(now);
    } else if (now == darkThemeEndTime || now.isBefore(darkThemeStartTime)) {
      timeLeft = darkThemeStartTime.difference(now);
    } else {
      timeLeft = darkThemeEndTime.add(Duration(days: 1)).difference(now);
    }

    return timeLeft;
  }
}
