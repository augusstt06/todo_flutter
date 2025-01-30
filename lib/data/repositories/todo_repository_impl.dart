import 'package:todo_flutter/data/models/todo.dart';
import 'package:todo_flutter/data/repositories/todo_repository.dart';

import '../dataSource/todo_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<void> createTodo(Todo todo) async {
    try {
      await _dataSource.createTodo(todo);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    try {
      await _dataSource.deleteTodo(todo);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      await _dataSource.updateTodo(todo);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    try {
      return await _dataSource.getAllTodo();
    } catch (err) {
      rethrow;
    }
  }
}
