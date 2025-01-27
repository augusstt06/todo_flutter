import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/data/data.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(children: [
        Container(
            padding: EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: todo.category.color.withOpacity(0.3),
                border: Border.all(width: 2, color: todo.category.color)),
            child: Center(
                child: Icon(todo.category.icon, color: todo.category.color))),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.title),
              Text(todo.time),
            ],
          ),
        ),
        Checkbox(value: todo.isCompleted, onChanged: (value) {}),
      ]),
    );
  }
}
