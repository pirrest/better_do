import 'package:better_do/model/task.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:better_do/repositories/preferences.dart';
import 'package:better_do/view/task/due_date_form_field.dart';
import 'package:better_do/view/task/due_time_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TaskPage extends HookConsumerWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var task = context.read<Task?>()?.copyWith();
    final isNewTask = task == null;
    task ??= Task(
      createdDate: DateTime.now(),
      text: "",
      id: ref.read(rpPreferencesProvider).getNextTasksId(),
    );
    final textController = useTextEditingController(text: task.text);
    final formKey = GlobalKey<FormState>();
    final focusNode = useFocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(isNewTask ? "Add task" : "Edit task"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedSize(
                          alignment: Alignment.topLeft,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: TextFormField(
                            autofocus: true,
                            maxLines: null,
                            focusNode: focusNode,
                            onTapOutside: (event) {
                              focusNode.unfocus();
                            },
                            decoration: const InputDecoration(
                              labelText: "Task",
                            ),
                            controller: textController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        DueDateFormField(
                          date: task.dueDate,
                          onSelected: (date) {
                            task = task!.copyWith(dueDate: date);
                          },
                        ),
                        DueTimeFormField(
                          date: task?.dueDate,
                          onSelected: (date) {
                            final isFullDay = date == null;
                            date ??= task?.dueDate?.copyWith(hour: 0, minute: 0);
                            task = task!.copyWith(dueDate: date, isFullDay: isFullDay);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      task = task!.copyWith(text: textController.text);
                      if (isNewTask) {
                        ref.read(tasksProvider.notifier).addTask(task!);
                      } else {
                        ref.read(tasksProvider.notifier).updateTask(task!);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}