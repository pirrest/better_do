import 'package:better_do/model/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

part 'task.g.dart';

enum TimeEstimate { minutes, hours, days, weeks, months, years }

@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    required String text,
    required DateTime createdDate,
    DateTime? dueDate,
    DateTime? doneDate,
    @Default([]) List<Tag> tags,
    @Default([]) List<String> files,
    @Default(5) int priority,
    @Default(TimeEstimate.hours) TimeEstimate timeEstimate,
    @Default(false) bool isDone,
    @Default(true) bool isFullDay,
    @Default(false)
    @JsonKey(includeFromJson: false, includeToJson: false)
    bool isLocal,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}