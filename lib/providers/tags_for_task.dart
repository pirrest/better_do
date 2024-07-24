import 'package:better_do/model/tag.dart';
import 'package:better_do/model/task.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags_for_task.g.dart';

@riverpod
List<Tag> tagsForTask(TagsForTaskRef ref, {required int taskId}) {
  // listening for tasksProvider to update once it is changed
  final tasks = ref.watch(tasksProvider);
  final task = tasks.firstWhereOrNull((element) => element.id == taskId);
  return task?.tags ?? [];
}