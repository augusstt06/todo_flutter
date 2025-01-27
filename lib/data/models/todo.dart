// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:todo_flutter/utils/todo_category.dart';

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
}
