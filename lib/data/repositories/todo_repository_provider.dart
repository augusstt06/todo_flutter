import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/datasource/todo_datasource_provider.dart';
import 'package:todo_flutter/data/repositories/repositories.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final datasource = ref.watch(todoDatasourceProvider);
  return TodoRepositoryImpl(datasource);
});
