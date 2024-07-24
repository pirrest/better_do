import 'package:better_do/main.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences.g.dart';

@riverpod
Preferences rpPreferences(RpPreferencesRef ref) {
  return Preferences(sharedPreferences);
}

class Preferences {
  final SharedPreferences _prefs;

  Preferences(this._prefs);

  int get lastTaskId => _prefs.getInt('lastTaskId') ?? 0;
  set lastTaskId(value) => _prefs.setInt('lastTaskId', value);
  int getNextTaskId() => ++lastTaskId;

  String getTasks() => _prefs.getString('tasks') ?? "[]";

  Future<void> setTasks(String value) async =>
      await _prefs.setString('tasks', value);

  String getTaskFilters() => _prefs.getString('taskFilters') ?? "[]";

  Future<void> setTaskFilters(String value) async =>
      await _prefs.setString('taskFilters', value);

  int get tasksLastId => _prefs.getInt('tasksLastId') ?? 0;

  Future<void> setTasksLastId(int value) async =>
      await _prefs.setInt('tasksLastId', value);

  int getNextTasksId() {
    final newTasksLastId = tasksLastId + 1;
    setTasksLastId(newTasksLastId);
    return newTasksLastId;
  }

  ThemeMode getThemeMode() => ThemeMode.values.byName(_prefs.getString('themeMode') ?? "system");

  Future<void> setThemeMode(ThemeMode value) async =>
      await _prefs.setString('themeMode', value.name);

  TimeOfDay getWholeDayTaskNotificationTime() {
    final str = _prefs.getString('wholeDayTaskNotificationTime');
    if(str != null) {
      final ar = str.split(":");
      return TimeOfDay(hour: int.parse(ar.first), minute: int.parse(ar.last));
    } else {
      return const TimeOfDay(hour: 9, minute: 0);
    }
  }

  Future<void> setWholeDayTaskNotificationTime(TimeOfDay value) async =>
      await _prefs.setString('wholeDayTaskNotificationTime', "${value.hour}:${value.minute}");

}