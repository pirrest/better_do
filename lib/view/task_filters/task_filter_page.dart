import 'package:better_do/model/task_filter.dart';
import 'package:better_do/providers/task_filters.dart';
import 'package:better_do/view/task/tags_form_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TaskFilterPage extends HookConsumerWidget {
  const TaskFilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = context.read<TaskFilter?>()?.copyWith();
    final isNew = filter == null;
    filter ??= TaskFilter(
      id: const Uuid().v4(),
      name: "",
    );
    final formKey = GlobalKey<FormState>();
    final nameFocusNode = useFocusNode();
    final queryFocusNode = useFocusNode();
    final nameTextController = useTextEditingController(text: filter.name);
    final queryTextController =
        useTextEditingController(text: filter.textQuery);

    return Scaffold(
      appBar: AppBar(
        title: Text(isNew ? "Add filter" : "Edit filter"),
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
                            focusNode: nameFocusNode,
                            onTapOutside: (event) {
                              nameFocusNode.unfocus();
                            },
                            decoration: const InputDecoration(
                              labelText: "Name",
                            ),
                            controller: nameTextController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Name should not be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        TextFormField(
                          autofocus: true,
                          maxLines: null,
                          focusNode: queryFocusNode,
                          onTapOutside: (event) {
                            queryFocusNode.unfocus();
                          },
                          decoration: const InputDecoration(
                            labelText: "Query",
                          ),
                          controller: queryTextController,
                        ),
                        const SizedBox(height: 8),
                        const Text("Tags to include:"),
                        TagsFormField(
                          tags: [...filter.includedTags ?? []],
                          onSelect: (tags) {
                            filter = filter!.copyWith(includedTags: tags);
                          },
                        ),
                        const SizedBox(height: 8),
                        const Text("Tags to exclude:"),
                        TagsFormField(
                          tags: [...filter?.excludedTags ?? []],
                          onSelect: (tags) {
                            filter = filter!.copyWith(excludedTags: tags);
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
                      final query = queryTextController.text.trim();
                      filter = filter!.copyWith(
                        name: nameTextController.text.trim(),
                        textQuery: query.isNotEmpty ? query : null,
                      );

                      if (isNew) {
                        ref.read(taskFiltersProvider.notifier).add(filter!);
                      } else {
                        ref.read(taskFiltersProvider.notifier).update(filter!);
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