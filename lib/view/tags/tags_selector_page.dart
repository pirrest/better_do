import 'package:better_do/model/tag.dart';
import 'package:better_do/model/task.dart';
import 'package:better_do/providers/tags.dart';
import 'package:better_do/providers/tags_for_task.dart';
import 'package:better_do/providers/tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as p;
import 'package:uuid/uuid.dart';

class TagsSelectorPage extends StatefulHookConsumerWidget {
  const TagsSelectorPage({super.key, required this.selectedTags, required this.onSelect,});

  final List<Tag> selectedTags;
  final void Function(List<Tag> selectedTags) onSelect;

  @override
  ConsumerState createState() => _TagsPageState();
}

class _TagsPageState extends ConsumerState<TagsSelectorPage> {

  List<Tag> _selectedTags = [];

  @override
  void initState() {
    super.initState();
    _selectedTags = widget.selectedTags;
  }

  @override
  Widget build(BuildContext context) {
    final tags = ref.watch(tagsProvider);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select tag(s)"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        focusNode: focusNode,
                    controller: textController,
                        onTapOutside: (event) {
                          focusNode.unfocus();
                        },
                  )),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      final text = textController.text.trim();
                      if (text.isEmpty) return;
                      final tag = Tag(id: const Uuid().v4(), name: text);
                      ref
                          .read(tagsProvider.notifier)
                          .add(tag);
                      textController.clear();
                      setState(() {
                        _selectedTags.add(tag);
                        widget.onSelect(_selectedTags);
                      });
                    },
                    child: const Text("Add"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: tags.length,
                    (context, index) {
                      final tag = tags[index];
                      final isSelected = _selectedTags.contains(tag);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if(_selectedTags.contains(tag)) {
                              _selectedTags.remove(tag);
                            } else {
                              _selectedTags.add(tag);
                            }
                            widget.onSelect(_selectedTags);
                          });
                        },
                        child: InkWell(
                          child: ListTile(
                            leading: isSelected ? const Icon(CupertinoIcons.checkmark_square) : const Icon(CupertinoIcons.square),
                            title: Text(tag.name),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}