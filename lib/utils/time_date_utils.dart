import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/data/models/todo.dart';

import '../providers/date_provider.dart';

class TimeDateUtils {
  TimeDateUtils._();
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      return DateFormat.jm().format(date);
    } catch (e) {
      return '12:00 pm';
    }
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2025),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      ref.read(dateProvider.notifier).state = selectedDate;
    }
  }

  static bool isTodoFromSelectedDate(Todo todo, DateTime selectedDate) {
    final DateTime todoDate = _stringToDateTime(todo.date);
    final isSameYear = todoDate.year == selectedDate.year;
    final isSameMonth = todoDate.month == selectedDate.month;
    final isSameDay = todoDate.day == selectedDate.day;
    if (isSameYear && isSameMonth && isSameDay) {
      return true;
    }

    return false;
  }

  static DateTime _stringToDateTime(String date) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(date);
    } catch (e) {
      return DateTime.now();
    }
  }
}
