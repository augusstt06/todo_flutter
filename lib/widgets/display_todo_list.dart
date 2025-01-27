import 'package:flutter/material.dart';
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
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(child: Icon(Icons.person))),
                  ]);
                }));
  }
}
