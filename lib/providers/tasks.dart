import 'dart:convert';

import 'package:better_do/model/task.dart';
import 'package:better_do/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  List<Task> build() {
    final tasksRaw = ref.read(rpPreferencesProvider).getTasks();
    final tasksList = jsonDecode(tasksRaw);
    final tasks = [for (var taskRaw in tasksList) Task.fromJson(taskRaw)];
    tasks.sort((a, b) {
      var res = a.priority.compareTo(b.priority);
      if (res == 0 && a.dueDate != null && b.dueDate != null) {
        res = a.dueDate!.compareTo(b.dueDate!);
      }
      if (res == 0) {
        res = a.createdDate.compareTo(b.createdDate);
      }
      return res;
    });
    return tasks;
  }

  Future<void> saveTasks() async {
    await ref.read(rpPreferencesProvider).setTasks(jsonEncode(state));
  }

  Future<void> addTask(Task task) async {
    final tasks = [...state];
    tasks.add(task);
    state = tasks;
    await saveTasks();
  }

  Future<void> updateTask(Task task) async {
    final tasks = [...state];
    final index = tasks.indexWhere((element) => element.id == task.id);
    if(index == -1) return;
    tasks[index] = task;
    state = tasks;
    await saveTasks();
  }

  Future<void> removeTask(String id) async {
    final tasks = [...state];
    tasks.removeWhere((element) => element.id == id);
    state = tasks;
    await saveTasks();
  }
}