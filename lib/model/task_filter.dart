import 'package:better_do/model/convertors.dart';
import 'package:better_do/model/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:range_type/predefined_ranges.dart';

part 'task_filter.freezed.dart';

part 'task_filter.g.dart';

@freezed
class TaskFilter with _$TaskFilter {
  const factory TaskFilter({
    required String id,
    required String name,
    Duration? timeLeft,
    String? textQuery,
    List<Tag>? includedTags,
    List<Tag>? excludedTags,
    @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
    DateTimeRange? createdDate,
    @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
    DateTimeRange? dueDate,
    bool? isDone,
  }) = _TaskFilter;

  bool get isEmpty =>
      timeLeft == null &&
      !(textQuery?.isNotEmpty == true) &&
      !(includedTags?.isNotEmpty == true) &&
      !(excludedTags?.isNotEmpty == true) &&
      createdDate == null &&
      dueDate == null &&
      isDone == null;

  const TaskFilter._();

  factory TaskFilter.fromJson(Map<String, dynamic> json) =>
      _$TaskFilterFromJson(json);
}