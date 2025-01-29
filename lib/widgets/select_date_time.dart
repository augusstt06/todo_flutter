import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/providers/date_provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/providers/time_provider.dart';
import 'package:todo_flutter/utils/convert.dart';
import 'widgets.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
                title: 'Date',
                hintText: DateFormat.yMMMd().format(date),
                readOnly: true,
                suffixIcon: IconButton(
                    onPressed: () => _selectDate(context, ref),
                    icon: const FaIcon(FontAwesomeIcons.calendar)))),
        const Gap(10),
        Expanded(
            child: CustomTextField(
          title: 'Time',
          hintText: Convert.timeToString(time),
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: const FaIcon(FontAwesomeIcons.clock)),
        ))
      ],
    );
  }

  // 시계 위젯을 띄워서 시간을 선택하는 함수
  void _selectTime(BuildContext context, WidgetRef ref) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (selectedTime != null) {
      ref.read(timeProvider.notifier).state = selectedTime;
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
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
