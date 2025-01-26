import 'package:flutter/material.dart';
import 'package:todo_flutter/config/config.dart';
import 'package:todo_flutter/screens/screens.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: HomeScreen(),
    );
  }
}
