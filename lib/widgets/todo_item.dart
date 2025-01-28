import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/circle_container.dart';

class TodoItem extends StatelessWidget {
  // 클래스 필드 변수
  // 객체가 생성될때 한번만 초기화됨. -> 변경 불가
  const TodoItem({super.key, required this.todo, this.onCompleted});
  final Todo todo;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    // Widget build 메서드안에 정의.
    // 해당 메서드 안에서만 유효. -> 메서드가 호출될때마다 초기화.

    final style = context.textTheme;
    final double iconOpacity = todo.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = todo.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;

    final fontWeight = todo.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(children: [
        CircleContainer(
            color: todo.category.color.withOpacity(backgroundOpacity),
            child: Center(
              child: Icon(todo.category.icon,
                  color: todo.category.color.withOpacity(iconOpacity)),
            )),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.title,
                  style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                      fontSize: 20,
                      fontWeight: fontWeight)),
              Text(todo.time,
                  style:
                      style.titleMedium?.copyWith(decoration: textDecoration)),
            ],
          ),
        ),
        Checkbox(value: todo.isCompleted, onChanged: onCompleted),
      ]),
    );
  }
}
