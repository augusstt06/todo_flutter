import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/config/routes/routes_location.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/providers/todo/todo_provider.dart';
import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/display_todo_list.dart';
import 'package:todo_flutter/widgets/display_white_text.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final todoState = ref.watch(todoProvider);

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayWhiteText(
                            text: 'Aug 18, 1995',
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        DisplayWhiteText(text: 'Todolist', fontSize: 40)
                      ]),
                )),
          ],
        ),
        Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayTodoList(todos: _incompleteTodos(todoState.todos)),
                    const Gap(12),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(12),
                    DisplayTodoList(
                        todos: _completedTodos(todoState.todos),
                        isCompletedTodo: true),
                    const Gap(12),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary),
                        onPressed: () => context.push(RouteLocation.createTodo),
                        child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: DisplayWhiteText(text: 'Add Todo')))
                  ],
                )))
      ],
    ));
  }

  List<Todo> _completedTodos(List<Todo> todos) {
    final List<Todo> filteredTodos =
        todos.where((todo) => todo.isCompleted).toList();

    return filteredTodos;
  }

  List<Todo> _incompleteTodos(List<Todo> todos) {
    final List<Todo> filteredTodos =
        todos.where((todo) => !todo.isCompleted).toList();

    return filteredTodos;
  }
}
