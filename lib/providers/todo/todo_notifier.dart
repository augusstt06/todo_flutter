import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/data/models/todo.dart';
import 'package:todo_flutter/data/repositories/todo_repository.dart';
import 'package:todo_flutter/providers/providers.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoRepository _repository;
  TodoNotifier(this._repository) : super(const TodoState.initial());

  Future<void> createTodo(Todo todo) async {
    try {
      await _repository.createTodo(todo);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      final isCompleted = !todo.isCompleted;
      final updatedTodo = todo.copyWith(isCompleted: isCompleted);
      await _repository.updateTodo(updatedTodo);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await _repository.deleteTodo(todo);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> getAllTodos() async {
    try {
      final todos = await _repository.getAllTodos();
      state = state.copyWith(todos: todos);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
