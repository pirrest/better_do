import 'package:range_type/predefined_ranges.dart';

intRangeFromJson(String value) => IntRange.parse(value);
intRangeToJson(IntRange? value) => value?.toString();

dateTimeRangeFromJson(String value) => DateTimeRange.parse(value);
dateTimeRangeToJson(DateTimeRange? value) => value?.toString();