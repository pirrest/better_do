import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String getRelativeDate({required String formatPattern}) {
    String dateString;
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));
    if (year == today.year && month == today.month && day == today.day) {
      dateString = "Today";
    } else if (year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day) {
      dateString = "Yesterday";
    } else if (year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day) {
      dateString = "Tomorrow";
    } else {
      dateString = DateFormat(formatPattern).format(this);
    }
    return dateString;
  }

  DateTime get atMidNight =>
      copyWith(hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,);
}