// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskFilter _$TaskFilterFromJson(Map<String, dynamic> json) {
  return _TaskFilter.fromJson(json);
}

/// @nodoc
mixin _$TaskFilter {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Duration? get timeLeft => throw _privateConstructorUsedError;
  String? get textQuery => throw _privateConstructorUsedError;
  List<Tag>? get includedTags => throw _privateConstructorUsedError;
  List<Tag>? get excludedTags => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
  DateTimeRange? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
  DateTimeRange? get dueDate => throw _privateConstructorUsedError;
  bool? get isDone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskFilterCopyWith<TaskFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFilterCopyWith<$Res> {
  factory $TaskFilterCopyWith(
          TaskFilter value, $Res Function(TaskFilter) then) =
      _$TaskFilterCopyWithImpl<$Res, TaskFilter>;
  @useResult
  $Res call(
      {String id,
      String name,
      Duration? timeLeft,
      String? textQuery,
      List<Tag>? includedTags,
      List<Tag>? excludedTags,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      DateTimeRange? createdDate,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      DateTimeRange? dueDate,
      bool? isDone});
}

/// @nodoc
class _$TaskFilterCopyWithImpl<$Res, $Val extends TaskFilter>
    implements $TaskFilterCopyWith<$Res> {
  _$TaskFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? timeLeft = freezed,
    Object? textQuery = freezed,
    Object? includedTags = freezed,
    Object? excludedTags = freezed,
    Object? createdDate = freezed,
    Object? dueDate = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeLeft: freezed == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration?,
      textQuery: freezed == textQuery
          ? _value.textQuery
          : textQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      includedTags: freezed == includedTags
          ? _value.includedTags
          : includedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      excludedTags: freezed == excludedTags
          ? _value.excludedTags
          : excludedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskFilterImplCopyWith<$Res>
    implements $TaskFilterCopyWith<$Res> {
  factory _$$TaskFilterImplCopyWith(
          _$TaskFilterImpl value, $Res Function(_$TaskFilterImpl) then) =
      __$$TaskFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Duration? timeLeft,
      String? textQuery,
      List<Tag>? includedTags,
      List<Tag>? excludedTags,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      DateTimeRange? createdDate,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      DateTimeRange? dueDate,
      bool? isDone});
}

/// @nodoc
class __$$TaskFilterImplCopyWithImpl<$Res>
    extends _$TaskFilterCopyWithImpl<$Res, _$TaskFilterImpl>
    implements _$$TaskFilterImplCopyWith<$Res> {
  __$$TaskFilterImplCopyWithImpl(
      _$TaskFilterImpl _value, $Res Function(_$TaskFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? timeLeft = freezed,
    Object? textQuery = freezed,
    Object? includedTags = freezed,
    Object? excludedTags = freezed,
    Object? createdDate = freezed,
    Object? dueDate = freezed,
    Object? isDone = freezed,
  }) {
    return _then(_$TaskFilterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeLeft: freezed == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration?,
      textQuery: freezed == textQuery
          ? _value.textQuery
          : textQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      includedTags: freezed == includedTags
          ? _value._includedTags
          : includedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      excludedTags: freezed == excludedTags
          ? _value._excludedTags
          : excludedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskFilterImpl extends _TaskFilter {
  const _$TaskFilterImpl(
      {required this.id,
      required this.name,
      this.timeLeft,
      this.textQuery,
      final List<Tag>? includedTags,
      final List<Tag>? excludedTags,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      this.createdDate,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      this.dueDate,
      this.isDone})
      : _includedTags = includedTags,
        _excludedTags = excludedTags,
        super._();

  factory _$TaskFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskFilterImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Duration? timeLeft;
  @override
  final String? textQuery;
  final List<Tag>? _includedTags;
  @override
  List<Tag>? get includedTags {
    final value = _includedTags;
    if (value == null) return null;
    if (_includedTags is EqualUnmodifiableListView) return _includedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tag>? _excludedTags;
  @override
  List<Tag>? get excludedTags {
    final value = _excludedTags;
    if (value == null) return null;
    if (_excludedTags is EqualUnmodifiableListView) return _excludedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
  final DateTimeRange? createdDate;
  @override
  @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
  final DateTimeRange? dueDate;
  @override
  final bool? isDone;

  @override
  String toString() {
    return 'TaskFilter(id: $id, name: $name, timeLeft: $timeLeft, textQuery: $textQuery, includedTags: $includedTags, excludedTags: $excludedTags, createdDate: $createdDate, dueDate: $dueDate, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFilterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            (identical(other.textQuery, textQuery) ||
                other.textQuery == textQuery) &&
            const DeepCollectionEquality()
                .equals(other._includedTags, _includedTags) &&
            const DeepCollectionEquality()
                .equals(other._excludedTags, _excludedTags) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      timeLeft,
      textQuery,
      const DeepCollectionEquality().hash(_includedTags),
      const DeepCollectionEquality().hash(_excludedTags),
      createdDate,
      dueDate,
      isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFilterImplCopyWith<_$TaskFilterImpl> get copyWith =>
      __$$TaskFilterImplCopyWithImpl<_$TaskFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskFilterImplToJson(
      this,
    );
  }
}

abstract class _TaskFilter extends TaskFilter {
  const factory _TaskFilter(
      {required final String id,
      required final String name,
      final Duration? timeLeft,
      final String? textQuery,
      final List<Tag>? includedTags,
      final List<Tag>? excludedTags,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      final DateTimeRange? createdDate,
      @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
      final DateTimeRange? dueDate,
      final bool? isDone}) = _$TaskFilterImpl;
  const _TaskFilter._() : super._();

  factory _TaskFilter.fromJson(Map<String, dynamic> json) =
      _$TaskFilterImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Duration? get timeLeft;
  @override
  String? get textQuery;
  @override
  List<Tag>? get includedTags;
  @override
  List<Tag>? get excludedTags;
  @override
  @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
  DateTimeRange? get createdDate;
  @override
  @JsonKey(fromJson: dateTimeRangeFromJson, toJson: dateTimeRangeToJson)
  DateTimeRange? get dueDate;
  @override
  bool? get isDone;
  @override
  @JsonKey(ignore: true)
  _$$TaskFilterImplCopyWith<_$TaskFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
