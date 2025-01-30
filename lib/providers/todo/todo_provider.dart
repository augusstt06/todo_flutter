import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/providers/providers.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  final respository = ref.watch(todoRepositoryProvider);
  return TodoNotifier(respository);
});
