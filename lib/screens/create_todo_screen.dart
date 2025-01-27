import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/display_white_text.dart';

class CreateTodoScreen extends StatelessWidget {
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
