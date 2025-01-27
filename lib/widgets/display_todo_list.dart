import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/data/models/todo.dart';

import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/custom_container.dart';

class DisplayTodoList extends StatelessWidget {
  const DisplayTodoList({super.key, required this.todos});
  final List<Todo> todos;
  final bool isCompletedTodo = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTodo ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage =
        isCompletedTodo ? 'There is no completed todo yet' : 'There is no todo';

    return CustomContainer(
        height: height,
        child: todos.isEmpty
            ? Center(
                child: Text(emptyTasksMessage,
                    style: context.textTheme.headlineSmall))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Row(children: [
                    Container(
                        padding: EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: todo.category.color.withOpacity(0.3),
                            border: Border.all(
                                width: 2, color: todo.category.color)),
                        child: Center(
                            child: Icon(todo.category.icon,
                                color: todo.category.color))),
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
                  ]);
                }));
  }
}
