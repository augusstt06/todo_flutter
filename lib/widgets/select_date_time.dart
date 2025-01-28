import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'widgets.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
                title: 'Date',
                hintText: 'Aug , 18',
                readOnly: true,
                suffixIcon: IconButton(
                    onPressed: () => _selectDate(context),
                    icon: const FaIcon(FontAwesomeIcons.calendar)))),
        const Gap(10),
        Expanded(
            child: CustomTextField(
          title: 'Time',
          hintText: '10:00',
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () => _selectTime(context),
              icon: const FaIcon(FontAwesomeIcons.clock)),
        ))
      ],
    );
  }

  // 시계 위젯을 띄워서 시간을 선택하는 함수
  void _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectedTime != null) {
      //
    }
  }

  void _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2025),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      //
    }
  }
}
