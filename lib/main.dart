import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/app/todo_app.dart';

// riverpod 사용을 위해 ProviderScope 사용
void main() {
  runApp(const ProviderScope(child: TodoApp()));
}
