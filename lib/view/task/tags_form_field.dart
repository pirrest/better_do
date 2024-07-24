import 'package:better_do/model/tag.dart';
import 'package:better_do/extensions/build_context.dart';
import 'package:better_do/view/tags/tags_selector_page.dart';
import 'package:flutter/material.dart';

class TagsFormField extends StatefulWidget {
  const TagsFormField({
    super.key,
    required this.tags,
    required this.onSelect,
  });

  final List<Tag> tags;
  final void Function(List<Tag> tags) onSelect;

  @override
  State<TagsFormField> createState() => _TagsFormFieldState();
}

class _TagsFormFieldState extends State<TagsFormField> {
  List<Tag> _tags = [];

  @override
  void initState() {
    super.initState();
    _tags = widget.tags;
  }

  @override
  Widget build(BuildContext context) {
    final hasTags = widget.tags.isNotEmpty;
    return hasTags
        ? Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: 16,
                  runSpacing: 16,
                  children: [
                    for (var tag in widget.tags) ...[
                      Container(
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        decoration: BoxDecoration(
                          color: context.theme.indicatorColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(tag.name),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    _tags.remove(tag);
                                    widget.onSelect(_tags);
                                  });
                                },
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return TagsSelectorPage(
                      selectedTags: widget.tags,
                      onSelect: (selectedTags) {
                        setState(() {
                          _tags = selectedTags;
                          widget.onSelect(widget.tags);
                        });
                      },
                    );
                  },
                ));
              },
            ),
          ],
        )
        : ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return TagsSelectorPage(
                    selectedTags: widget.tags,
                    onSelect: (selectedTags) {
                      setState(() {
                        _tags = selectedTags;
                        widget.onSelect(widget.tags);
                      });
                    },
                  );
                },
              ));
            },
            child: const Text("Add tag"));
  }
}