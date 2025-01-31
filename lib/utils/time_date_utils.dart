import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
}
