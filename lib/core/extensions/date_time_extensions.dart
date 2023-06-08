extension DateTimeExtension on DateTime {
  DateTime get firstHourOfDay =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  DateTime get lastHourOfDay => copyWith(
      hour: 23, minute: 59, second: 59, millisecond: 59, microsecond: 59);

  DateTime addMonths(int months) {
    final today = DateTime.now();
    return DateTime(today.year, today.month + months, today.day);
  }
}
