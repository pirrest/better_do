import 'dart:convert';

import 'package:better_do/model/tag.dart';
import 'package:better_do/repositories/preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags.g.dart';

@riverpod
class Tags extends _$Tags {
  @override
  List<Tag> build() {
    final tagsRaw = ref.read(rpPreferencesProvider).getTags();
    final tagsList = jsonDecode(tagsRaw);
    final tags = [for (var tagRaw in tagsList) Tag.fromJson(tagRaw)];
    return tags;
  }

  Future<void> save() async {
    await ref.read(rpPreferencesProvider).setTags(jsonEncode(state));
  }

  Future<void> add(Tag tag) async {
    final tags = [...state];
    final index = tags.indexWhere((element) => element.name.toLowerCase() == tag.name.toLowerCase(),);
    if(index > -1) {
      tags[index] = tag;
    } else {
      tags.insert(0, tag);
    }
    state = tags;
    await save();
  }

  Future<void> update(Tag tag) async {
    final tags = [...state];
    final index = tags.indexWhere((element) => element.id == tag.id);
    if (index == -1) return;
    tags[index] = tag;
    state = tags;
    await save();
  }

  Future<void> remove(String id) async {
    final tags = [...state];
    tags.removeWhere((element) => element.id == id);
    state = tags;
    await save();
  }

}