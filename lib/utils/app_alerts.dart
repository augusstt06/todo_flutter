import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/data/models/todo.dart';
import 'package:todo_flutter/providers/todo/todo_provider.dart';
import 'package:todo_flutter/utils/utils.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyLarge
            ?.copyWith(color: context.colorScheme.surface),
      ),
      backgroundColor: context.colorScheme.primary,
    ));
  }

  static Future<void> showDeleteAlert(
      BuildContext context, WidgetRef ref, Todo todo) async {
    Widget cancelButton =
        TextButton(onPressed: () => context.pop(), child: const Text('No'));
    Widget deleteButton = TextButton(
        onPressed: () {
          ref.read(todoProvider.notifier).deleteTodo(todo);
          context.pop();
        },
        child: const Text('Yes'));
    AlertDialog alert = AlertDialog(
        title: const Text('Are you sure you want to delete this todo?'),
        actions: [cancelButton, deleteButton]);
    await showDialog(context: context, builder: (context) => alert);
  }
}
