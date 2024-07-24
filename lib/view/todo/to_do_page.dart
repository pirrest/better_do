import 'package:better_do/providers/tasks.dart';
import 'package:better_do/providers/tasks_to_do.dart';
import 'package:better_do/view/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as p;

class ToDoPage extends ConsumerWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(tasksToDoProvider);
    final hasTasks = todos.isNotEmpty;
    return Scaffold(
      appBar: AppBar(title: const Text("To do")),
      body: SafeArea(
        child: hasTasks ? CustomScrollView(
          slivers: [
            for (var key in todos.keys)
              SliverStickyHeader(
                header: Text(key),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: todos[key]!.length,
                  (context, index) {
                    final task = todos[key]![index];
                    final formatter = DateFormat("hh:mm");
                    final dueDateStr =
                        task.isFullDay ? "" : formatter.format(task.dueDate!);
                    final tagsStr = task.tags
                        .map(
                          (e) => "#${e.name}",
                        )
                        .join(", ");
                    final subtitle = [
                      if (dueDateStr.isNotEmpty) dueDateStr,
                      tagsStr
                    ].join("\n");
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
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
                  },
                )),
              )
          ],
        ) : const Center(child: Text("No tasks to do"),),
      ),
    );
  }
}