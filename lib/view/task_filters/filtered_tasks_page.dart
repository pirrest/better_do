import 'package:better_do/model/task_filter.dart';
import 'package:better_do/providers/filtered_tasks.dart';
import 'package:better_do/providers/task_filters.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:better_do/view/task/task_page.dart';
import 'package:better_do/view/task_filters/task_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' as p;

class FilteredTasksPage extends ConsumerStatefulWidget {
  const FilteredTasksPage({super.key});

  @override
  ConsumerState createState() => _FilteredTasksPageState();
}

class _FilteredTasksPageState extends ConsumerState<FilteredTasksPage> {
  @override
  void initState() {
    super.initState();
    final filter = ref.read(taskFiltersProvider).firstOrNull ?? const TaskFilter(id:"default", name:"Search");
    if (filter.isEmpty) {
      Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => p.Provider.value(
                  value: filter, child: const TaskFilterPage()),
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(taskFiltersProvider).first;
    final tasks = ref.watch(filteredTasksProvider(filter: filter));
    final hasTasks = tasks.isNotEmpty;
    itemBuilder(BuildContext context, int index) {
      final task = tasks[index];
      final formatter = task.isFullDay
          ? DateFormat("EEE, dd MMMM yyyy")
          : DateFormat("EEE, dd MMMM yyyy, hh:mm");
      final dueDateStr =
          task.dueDate != null ? formatter.format(task.dueDate!) : "";
      final tagsStr = task.tags
          .map(
            (e) => "#${e.name}",
          )
          .join(", ");
      final subtitle =
          [if (dueDateStr.isNotEmpty) dueDateStr, tagsStr].join("\n");
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
          subtitle: subtitle.isNotEmpty
              ? Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
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
      appBar: AppBar(
        title: const Text("Search"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p.Provider.value(
                          value: filter, child: const TaskFilterPage()),
                    ));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: SafeArea(
        child: hasTasks
            ? ListView.builder(
                itemCount: tasks.length,
                itemBuilder: itemBuilder,
              )
            : const Center(
                child: Text("No tasks found"),
              ),
      ),
    );
  }
}