import 'dart:convert';

import 'package:better_do/model/task_filter.dart';
import 'package:better_do/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_filters.g.dart';

@riverpod
class TaskFilters extends _$TaskFilters {
  @override
  List<TaskFilter> build() {
    final taskFiltersRaw = jsonDecode(ref.read(rpPreferencesProvider).getTaskFilters());
    return [
      for (var taskFilterRaw in taskFiltersRaw)
        TaskFilter.fromJson(taskFilterRaw)
    ];
  }

  Future<void> save() async {
    await ref.read(rpPreferencesProvider).setTaskFilters(jsonEncode(state));
  }

  Future<void> add(TaskFilter value) async {
    final list = [...state];
    list.add(value);
    state = list;
    await save();
  }

  Future<void> update(TaskFilter value) async {
    final list = [...state];
    final index = list.indexWhere((element) => element.id == value.id);
    if(index == -1) return;
    list[index] = value;
    state = list;
    await save();
  }

  Future<void> remove(String id) async {
    final list = [...state];
    list.removeWhere((element) => element.id == id);
    state = list;
    await save();
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    print('Tasks.reorder oldIndex: ${oldIndex}');
    print('Tasks.reorder newIndex: ${newIndex}');
    if (oldIndex < newIndex) {
      newIndex -= 1;
      print('Tasks.reorder newIndex: ${newIndex}');
    }
    final list = [...state];
    final task = list.removeAt(oldIndex);
    print('Tasks.reorder task: ${task}');
    list.insert(newIndex, task);
    state = list;
    print('Tasks.reorder list: ${list.indexOf(task)}');
    await save();
  }
}