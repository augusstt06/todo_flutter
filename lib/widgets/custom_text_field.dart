import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller});

  final String title;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        const Gap(10),
        TextField(
          // 텍스트 필드 제어
          controller: controller,
          // 텍스트 필드 외부 터치 시 포커스 해제
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(hintText: hintText),
          onChanged: (value) {},
        )
      ],
    );
  }
}
