import 'package:range_type/predefined_ranges.dart';

intRangeFromJson(String value) => IntRange.parse(value);
intRangeToJson(IntRange? value) => value?.toString();

DateTimeRange ?dateTimeRangeFromJson(String? value) => value != null ? DateTimeRange.parse(value) : null;
String? dateTimeRangeToJson(DateTimeRange? value) => value?.toString();