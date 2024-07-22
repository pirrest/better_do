import 'package:better_do/providers/tasks.dart';
import 'package:better_do/view/task/task_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
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
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              key: ValueKey(task),
              leading: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  final t = task.copyWith(isDone: value!);
                  ref.read(tasksProvider.notifier).updateTask(t);
                },
              ),
              title: GestureDetector(
                onTap: () {
                  final t = task.copyWith(isDone: !task.isDone);
                  ref.read(tasksProvider.notifier).updateTask(t);
                },
                child: Text(
                  task.text,
                  overflow: TextOverflow.ellipsis,
                ),
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
              // tileColor: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}