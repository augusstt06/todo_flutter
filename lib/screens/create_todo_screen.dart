import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/widgets/widgets.dart';

class CreateTodoScreen extends StatelessWidget {
  static CreateTodoScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTodoScreen();
  const CreateTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(text: 'Add new todo'),
      ),
    );
  }
}
