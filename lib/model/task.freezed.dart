// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  List<String> get files => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  TimeEstimate get timeEstimate => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  bool get isFullDay => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String text,
      DateTime createdDate,
      DateTime? dueDate,
      List<Tag> tags,
      List<String> files,
      int priority,
      TimeEstimate timeEstimate,
      bool isDone,
      bool isFullDay,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isLocal});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? createdDate = null,
    Object? dueDate = freezed,
    Object? tags = null,
    Object? files = null,
    Object? priority = null,
    Object? timeEstimate = null,
    Object? isDone = null,
    Object? isFullDay = null,
    Object? isLocal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      timeEstimate: null == timeEstimate
          ? _value.timeEstimate
          : timeEstimate // ignore: cast_nullable_to_non_nullable
              as TimeEstimate,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      DateTime createdDate,
      DateTime? dueDate,
      List<Tag> tags,
      List<String> files,
      int priority,
      TimeEstimate timeEstimate,
      bool isDone,
      bool isFullDay,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isLocal});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? createdDate = null,
    Object? dueDate = freezed,
    Object? tags = null,
    Object? files = null,
    Object? priority = null,
    Object? timeEstimate = null,
    Object? isDone = null,
    Object? isFullDay = null,
    Object? isLocal = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      timeEstimate: null == timeEstimate
          ? _value.timeEstimate
          : timeEstimate // ignore: cast_nullable_to_non_nullable
              as TimeEstimate,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isFullDay: null == isFullDay
          ? _value.isFullDay
          : isFullDay // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      required this.text,
      required this.createdDate,
      this.dueDate,
      final List<Tag> tags = const [],
      final List<String> files = const [],
      this.priority = 5,
      this.timeEstimate = TimeEstimate.hours,
      this.isDone = false,
      this.isFullDay = true,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.isLocal = false})
      : _tags = tags,
        _files = files;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final DateTime createdDate;
  @override
  final DateTime? dueDate;
  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _files;
  @override
  @JsonKey()
  List<String> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey()
  final int priority;
  @override
  @JsonKey()
  final TimeEstimate timeEstimate;
  @override
  @JsonKey()
  final bool isDone;
  @override
  @JsonKey()
  final bool isFullDay;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isLocal;

  @override
  String toString() {
    return 'Task(id: $id, text: $text, createdDate: $createdDate, dueDate: $dueDate, tags: $tags, files: $files, priority: $priority, timeEstimate: $timeEstimate, isDone: $isDone, isFullDay: $isFullDay, isLocal: $isLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.timeEstimate, timeEstimate) ||
                other.timeEstimate == timeEstimate) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.isFullDay, isFullDay) ||
                other.isFullDay == isFullDay) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      createdDate,
      dueDate,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_files),
      priority,
      timeEstimate,
      isDone,
      isFullDay,
      isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final String text,
      required final DateTime createdDate,
      final DateTime? dueDate,
      final List<Tag> tags,
      final List<String> files,
      final int priority,
      final TimeEstimate timeEstimate,
      final bool isDone,
      final bool isFullDay,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool isLocal}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  DateTime get createdDate;
  @override
  DateTime? get dueDate;
  @override
  List<Tag> get tags;
  @override
  List<String> get files;
  @override
  int get priority;
  @override
  TimeEstimate get timeEstimate;
  @override
  bool get isDone;
  @override
  bool get isFullDay;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
