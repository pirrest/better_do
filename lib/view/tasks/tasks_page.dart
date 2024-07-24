import 'package:better_do/main.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:better_do/view/task/task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as p;

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({super.key});

  @override
  ConsumerState createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  bool _isEditable = false;

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(tasksProvider);
    final hasTasks = tasks.isNotEmpty;
    itemBuilder(BuildContext context, int index) {
      final task = tasks[index];
      final formatter = task.isFullDay
          ? DateFormat("EEE, dd MMMM yyyy")
          : DateFormat("EEE, dd MMMM yyyy, hh:mm");
      final dueDateStr = task.dueDate != null ? formatter.format(task.dueDate!) : "";
      final tagsStr =                 task.tags
          .map(
            (e) => "#${e.name}",
      )
          .join(", ");
      final subtitle = [if(dueDateStr.isNotEmpty)dueDateStr, tagsStr].join("\n");
      return GestureDetector(
        key: ValueKey(task),
        onTap: () {
          final t = task.copyWith(isDone: !task.isDone);
          ref.read(tasksProvider.notifier).updateTask(t);
        },
        child: ListTile(
          leading: _isEditable
              ? const SizedBox(
                  width: 48, height: 48, child: Icon(Icons.drag_handle_rounded))
              : Checkbox(
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
          subtitle:               Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          horizontalTitleGap: 0,
          trailing: _isEditable
              ? IconButton(
                  icon: const Icon(CupertinoIcons.trash),
                  onPressed: () {
                    ref.read(tasksProvider.notifier).removeTask(task.id);
                  },
                )
              : IconButton(
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
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          if (hasTasks)
            TextButton(
                onPressed: () {
                  setState(() {
                    _isEditable = !_isEditable;
                  });
                },
                child: _isEditable ? const Text("Done") : const Text("Edit"))
        ],
      ),
      body: SafeArea(
        child: hasTasks
            ? (_isEditable
                ? ReorderableListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: itemBuilder,
                    onReorder: (oldIndex, newIndex) {
                      ref
                          .read(tasksProvider.notifier)
                          .reorder(oldIndex, newIndex);
                    },
                  )
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: itemBuilder,
                  ))
            : Center(
                child: ElevatedButton(
                  child: const Text("Add your first task"),
                  onPressed: () {
                    addNewTask(context);
                  },
                ),
              ),
      ),
    );
  }
}