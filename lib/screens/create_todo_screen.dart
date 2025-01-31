import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_flutter/config/routes/routes.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/utils/app_alerts.dart';

import 'package:todo_flutter/utils/utils.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class CreateTodoScreen extends ConsumerStatefulWidget {
  static CreateTodoScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTodoScreen();
  const CreateTodoScreen({super.key});

  @override
  ConsumerState<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends ConsumerState<CreateTodoScreen> {
  // 텍스트 필드의 입력 컨트롤러
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  // 위젯이 사용되지 않을때 메모리 해제
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: DisplayWhiteText(text: 'Add new todo'),
        ),
        // 화면 가장자리 요소와 겹치지 않도록 SafeArea 사용
        body: SafeArea(
          child: SingleChildScrollView(
              // 스크롤 가능한 위젯의 동작 정의
              // AlwaysScrollableScrollPhysics: 내용이 다 보여도 스크롤 가능
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    title: 'Todo Title',
                    hintText: 'Title',
                    controller: _titleController,
                  ),
                  const Gap(10),
                  const SelectCategory(),
                  const Gap(10),
                  const SelectDateTime(),
                  const Gap(10),
                  CustomTextField(
                    title: 'Description',
                    hintText: 'Flutter Practice',
                    controller: _descriptionController,
                    maxLines: 6,
                  ),
                  const Gap(50),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary),
                      onPressed: _createTodo,
                      child: DisplayWhiteText(text: 'Save'))
                ],
              )),
        ));
  }

  void _createTodo() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final todo = Todo(
          title: title,
          description: description,
          time: Convert.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          category: category,
          isCompleted: false);
      await ref.read(todoProvider.notifier).createTodo(todo);
      // if (mounted) {
      AppAlerts.displaySnackBar(context, 'Todo created Successfully!');
      context.go(RouteLocation.home);
      // }
    } else {
      AppAlerts.displaySnackBar(context, 'Todo creation failed!');
    }
  }
}
