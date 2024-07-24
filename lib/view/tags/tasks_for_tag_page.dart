import 'package:better_do/main.dart';
import 'package:better_do/model/tag.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:better_do/providers/tasks_for_tag.dart';
import 'package:better_do/view/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as p;

class TasksForTagPage extends ConsumerWidget {
  const TasksForTagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tag = context.read<Tag>();
    final tasks = ref.watch(tasksForTagProvider(tag: tag));
    final hasTasks = tasks.isNotEmpty;

    itemBuilder(BuildContext context, int index) {
      final task = tasks[index];
      final formatter = task.isFullDay
          ? DateFormat("EEE, dd MMMM yyyy")
          : DateFormat("EEE, dd MMMM yyyy, hh:mm");
      return GestureDetector(
        key: ValueKey(task),
        onTap: () {
          final t = task.copyWith(isDone: !task.isDone);
          ref.read(tasksProvider.notifier).updateTask(t);
        },
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (value) {
              final t = task.copyWith(isDone: value!);
              ref.read(tasksProvider.notifier).updateTask(t);
            },
          ),
          title: Text(
            task.text,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: task.dueDate != null
              ? Text(formatter.format(task.dueDate!))
              : null,
          horizontalTitleGap: 0,
          trailing: IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return p.Provider.value(
                    value: task,
                    child: const TaskPage(),
                  );
                },
              ));
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Tasks for #${tag.name}")),
      body: SafeArea(
        child: hasTasks
            ? (ListView.builder(
                itemCount: tasks.length,
                itemBuilder: itemBuilder,
              ))
            : const Center(
                child: Text("No tasks for this tag"),
              ),
      ),
    );
  }
}