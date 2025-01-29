import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/utils/todo_category.dart';

final categoryProvider = StateProvider.autoDispose<TodoCategory>((ref) {
  return TodoCategory.others;
});
