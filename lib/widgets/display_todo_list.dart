import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/models/todo.dart';
import 'package:todo_flutter/utils/app_alerts.dart';

import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/custom_container.dart';
import 'package:todo_flutter/widgets/todo_details.dart';
import 'package:todo_flutter/widgets/todo_item.dart';

class DisplayTodoList extends ConsumerWidget {
  const DisplayTodoList(
      {super.key, required this.todos, this.isCompletedTodo = false});
  final List<Todo> todos;
  final bool isCompletedTodo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            : ListView.separated(
                shrinkWrap: true,
                itemCount: todos.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return InkWell(
                      onLongPress: () {
                        AppAlerts.showDeleteAlert(context, ref, todo);
                      },
                      onTap: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return TodoDetails(todo: todo);
                            });
                      },
                      child: TodoItem(todo: todo));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1.5,
                  );
                },
              ));
  }
}
