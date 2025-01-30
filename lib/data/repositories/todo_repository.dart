import 'package:todo_flutter/data/models/todo.dart';

abstract class TodoRepository {
  Future<void> createTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<List<Todo>> getAllTodos();
}
