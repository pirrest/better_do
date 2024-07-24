import 'package:better_do/extensions/date_time.dart';
import 'package:better_do/model/task.dart';
import 'package:better_do/model/task_filter.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "filtered_tasks.g.dart";

@riverpod
List<Task> filteredTasks(FilteredTasksRef ref, {required TaskFilter filter}) {
  final tasks = ref.watch(tasksProvider).where(
    (task) {
      if(filter.isEmpty) {
        return true;
      }
      if (filter.textQuery != null) {
        if (task.text.contains(filter.textQuery!)) {
          return true;
        }
      }
      final dueDate = task.dueDate?.atMidNight;
      if (dueDate != null) {
        if (filter.timeLeft != null) {
          final now = DateTime.now();
          if (now.add(filter.timeLeft!).isAfter(dueDate)) {
            return true;
          }
        }
        if (filter.dueDate != null) {
          if (filter.dueDate!.containsElement(dueDate)) {
            return true;
          }
        }
      }
      if (filter.createdDate != null) {
        if (filter.createdDate!.containsElement(task.createdDate.atMidNight)) {
          return true;
        }
      }
      if(filter.includedTags?.isNotEmpty == true) {
        for (var tag in task.tags) {
          if(filter.includedTags!.contains(tag)) {
            return true;
          }
        }
      }
      if(filter.excludedTags?.isNotEmpty == true) {
        for (var tag in filter.excludedTags!) {
          if(task.tags.contains(tag)) {
            return false;
          }
        }
      }
      if(filter.isDone != null) {
        if(task.isDone == filter.isDone) {
          return true;
        }
      }
      return false;
    },
  ).toList();
  return tasks;
}