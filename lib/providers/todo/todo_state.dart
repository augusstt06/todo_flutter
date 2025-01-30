import 'package:equatable/equatable.dart';
import 'package:todo_flutter/data/models/todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  const TodoState(this.todos);
  const TodoState.initial({this.todos = const []});

  TodoState copyWith({
    List<Todo>? todos,
  }) {
    return TodoState(
      todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [todos];
}
