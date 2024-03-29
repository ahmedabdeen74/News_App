import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences sharedPreferences;
  ThemeCubit(this.sharedPreferences) : super(ThemeMode.light) {
    loadThemeMode();
  }
  void loadThemeMode() {
    final saveThemeMode = sharedPreferences.getString('theme_mode');
    if (saveThemeMode == 'light') {
      emit(ThemeMode.light);
    }else if (saveThemeMode == 'dark') {
      emit(ThemeMode.dark);
    }
  }

  void changeTheme() async {
    final newThemeMode =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newThemeMode);
    await sharedPreferences.setString(
        'theme_mode', themeModeToString(newThemeMode));
  }

  String themeModeToString(ThemeMode themeMode) {
    return themeMode == ThemeMode.light ? 'light' : 'dark';
  }
}
