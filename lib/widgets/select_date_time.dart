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
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.calendar)))),
        const Gap(10),
        Expanded(
            child: CustomTextField(
          title: 'Time',
          hintText: '10:00',
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.clock)),
        ))
      ],
    );
  }
}
