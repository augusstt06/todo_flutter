import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/models/todo.dart';
import 'package:todo_flutter/data/repositories/todo_repository.dart';
import 'package:todo_flutter/providers/providers.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoRepository _repository;
  TodoNotifier(this._repository) : super(const TodoState.initial()) {
    getTodo();
  }

  Future<void> createTodo(Todo todo) async {
    try {
      await _repository.createTodo(todo).then((value) {
        getTodo();
      });
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      final isCompleted = !todo.isCompleted;
      final updatedTodo = todo.copyWith(isCompleted: isCompleted);
      await _repository.updateTodo(updatedTodo).then((value) {
        getTodo();
      });
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await _repository.deleteTodo(todo).then((value) {
        getTodo();
      });
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void getTodo() async {
    try {
      final todos = await _repository.getAllTodos();
      state = state.copyWith(todos: todos);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
