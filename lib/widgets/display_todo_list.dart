import 'package:flutter/material.dart';
import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/custom_container.dart';

class DisplayTodoList extends StatelessWidget {
  const DisplayTodoList({super.key});
  // final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return CustomContainer(
        height: deviceSize.height * 0.3,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const Text('Home');
            }));
  }
}
