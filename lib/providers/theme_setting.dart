import 'package:better_do/repositories/preferences.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_setting.g.dart';

@riverpod
class RpThemeSetting extends _$RpThemeSetting {
  @override
  ThemeMode build() {
    return ref.read(rpPreferencesProvider).getThemeMode();
  }

  void set(ThemeMode value) {
    state = value;
    ref.read(rpPreferencesProvider).setThemeMode(state);
  }
}