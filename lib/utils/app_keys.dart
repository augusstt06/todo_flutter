import 'package:flutter/material.dart';
import 'package:todo_flutter/utils/todo_keys.dart';

@immutable
class DBKeys {
  const DBKeys._();

  static const String dbName = 'todo.db';
  static const String dbTable = 'todos';
  static const String idColumn = TodoKeys.id;
  static const String titleColumn = TodoKeys.title;
  static const String descriptionColumn = TodoKeys.description;
  static const String timeColumn = TodoKeys.time;
  static const String dateColumn = TodoKeys.date;
  static const String categoryColumn = TodoKeys.category;
  static const String isCompletedColumn = TodoKeys.isCompleted;
}
