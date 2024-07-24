import 'package:better_do/model/tag.dart';
import 'package:better_do/model/task.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_for_tag.g.dart';

@riverpod
List<Task> tasksForTag(TasksForTagRef ref, {required Tag tag}) {
  final tasks = ref.watch(tasksProvider);
  return tasks.where((element) => element.tags.contains(tag)).toList();
}