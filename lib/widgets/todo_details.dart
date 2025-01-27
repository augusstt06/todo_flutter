import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/widgets/widgets.dart';
import 'package:todo_flutter/utils/utils.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            CircleContainer(
              color: todo.category.color,
              child: Icon(todo.category.icon, color: todo.category.color),
            ),
            const Gap(16),
            Text(todo.title,
                style: style.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(todo.time, style: style.titleMedium),
            const Gap(16),
            Visibility(
                visible: !todo.isCompleted,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Todo to be completed on ${todo.date}'),
                    Icon(Icons.check_box, color: todo.category.color)
                  ],
                )),
            const Gap(16),
            Divider(
              thickness: 1.6,
              color: todo.category.color,
            ),
            const Gap(16),
            Text(todo.description.isEmpty
                ? 'There is no description for this todo'
                : todo.description),
            const Gap(16),
            Visibility(
                visible: todo.isCompleted,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Todo is Completed'),
                    Icon(Icons.check_box, color: Colors.green)
                  ],
                )),
          ],
        ));
  }
}
