import 'package:equatable/equatable.dart';

import 'package:todo_flutter/utils/todo_category.dart';
import 'package:todo_flutter/utils/utils.dart';

class Todo extends Equatable {
  final int? id;
  final String title;
  final String description;
  final String time;
  final String date;
  final TodoCategory category;
  final bool isCompleted;

  const Todo({
    this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.category,
    required this.isCompleted,
  });

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.time == time &&
        other.date == date &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        time.hashCode ^
        date.hashCode ^
        isCompleted.hashCode;
  }

  @override
  List<Object> get props {
    return [
      id!,
      title,
      description,
      time,
      date,
      isCompleted,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TodoKeys.id: id,
      TodoKeys.title: title,
      TodoKeys.description: description,
      TodoKeys.time: time,
      TodoKeys.date: date,
      TodoKeys.category: category.name,
      TodoKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map[TodoKeys.id],
      title: map[TodoKeys.title],
      description: map[TodoKeys.description],
      time: map[TodoKeys.time],
      date: map[TodoKeys.date],
      category: TodoCategory.stringToCategory(map[TodoKeys.category]),
      isCompleted: map[TodoKeys.isCompleted] == 1 ? true : false,
    );
  }

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? time,
    String? date,
    TodoCategory? category,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
