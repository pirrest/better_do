import 'package:better_do/model/tag.dart';
import 'package:better_do/providers/tags.dart';
import 'package:better_do/view/tags/tasks_for_tag_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart' as p;

class TagsPage extends StatefulHookConsumerWidget {
  const TagsPage({super.key});

  @override
  ConsumerState createState() => _TagsPageState();
}

class _TagsPageState extends ConsumerState<TagsPage> {
  @override
  Widget build(BuildContext context) {
    final tags = ref.watch(tagsProvider);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tags"),
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
                      ref
                          .read(tagsProvider.notifier)
                          .add(Tag(id: const Uuid().v4(), name: text));
                      textController.clear();
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return p.Provider.value(value:tag, child: const TasksForTagPage());
                          },));
                        },
                        child: InkWell(
                          child: ListTile(
                            leading: const Icon(CupertinoIcons.tags),
                            title: Text(tag.name),
                            trailing: const Icon(Icons.arrow_forward_ios),
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