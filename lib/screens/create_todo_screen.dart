import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

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
        body: SingleChildScrollView(
            // 스크롤 가능한 위젯의 동작 정의
            // AlwaysScrollableScrollPhysics: 내용이 다 보여도 스크롤 가능
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextField(title: 'Todo Title', hintText: 'Title')
              ],
            )));
  }
}
