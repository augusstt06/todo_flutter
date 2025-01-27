import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/display_todo_list.dart';
import 'package:todo_flutter/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
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
                    DisplayTodoList(todos: [
                      Todo(
                        title: 'title',
                        description: 'description',
                        time: '10:12',
                        date: 'Aug, 07',
                        isCompleted: false,
                        category: TodoCategory.education,
                      ),
                      Todo(
                        title: 'title2',
                        description: 'description',
                        time: '10:12',
                        date: 'Aug, 08',
                        isCompleted: false,
                        category: TodoCategory.home,
                      )
                    ]),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    DisplayTodoList(todos: const []),
                    const Gap(20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary),
                        onPressed: () {},
                        child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DisplayWhiteText(text: 'Add Todo')))
                  ],
                )))
      ],
    ));
  }
}
