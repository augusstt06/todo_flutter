import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/dataSource/todo_datasource.dart';

final todoDatasourceProvider = Provider<TodoDataSource>((ref) {
  return TodoDataSource();
});
