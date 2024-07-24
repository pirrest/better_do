import 'package:better_do/extensions/date_time.dart';
import 'package:better_do/model/task.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_to_do.g.dart';

@riverpod
Map<String, List<Task>> tasksToDo(TasksToDoRef ref) {
  final tasks = ref.watch(tasksProvider).where((element) => !element.isDone).toList();
  tasks.sort(
    (a, b) =>
        (a.dueDate ?? a.createdDate).compareTo(b.dueDate ?? b.createdDate),
  );
  final Map<String, List<Task>> res = {};
  for (var task in tasks) {
    final dateStr = (task.dueDate ?? task.createdDate).getRelativeDate(formatPattern: "EEE, dd MMMM yyyy");
    res[dateStr] ??= [];
    res[dateStr]!.add(task);
  }
  return res;
}