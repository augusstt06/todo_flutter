import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/data/datasource/datasource.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final datasource = ref.watch(todoDatasourceProvider);
  return TodoRepositoryImpl(datasource);
});
