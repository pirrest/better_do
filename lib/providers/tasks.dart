import 'dart:convert';

import 'package:better_do/model/task.dart';
import 'package:better_do/providers/local_notifications.dart';
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
    await ref
        .read(localNotificationsServiceProvider)
        .scheduleTaskNotification(task);
    await saveTasks();
  }

  Future<void> updateTask(Task task) async {
    final tasks = [...state];
    final index = tasks.indexWhere((element) => element.id == task.id);
    if (index == -1) return;
    await ref
        .read(localNotificationsServiceProvider)
        .cancelTaskNotification(tasks[index].id);
    tasks[index] = task;
    await ref
        .read(localNotificationsServiceProvider)
        .scheduleTaskNotification(task);
    state = tasks;
    await saveTasks();
  }

  Future<void> removeTask(int id) async {
    final tasks = [...state];
    tasks.removeWhere((element) => element.id == id);
    state = tasks;
    await ref
        .read(localNotificationsServiceProvider)
        .cancelTaskNotification(id);
    await saveTasks();
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    print('Tasks.reorder oldIndex: ${oldIndex}');
    print('Tasks.reorder newIndex: ${newIndex}');
    if (oldIndex < newIndex) {
      newIndex -= 1;
      print('Tasks.reorder newIndex: ${newIndex}');
    }
    final tasks = [...state];
    final task = tasks.removeAt(oldIndex);
    print('Tasks.reorder task: ${task}');
    tasks.insert(newIndex, task);
    state = tasks;
    print('Tasks.reorder tasks: ${tasks.indexOf(task)}');
    await saveTasks();
  }
}