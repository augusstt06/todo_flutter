import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/utils/utils.dart';
import '../widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateTodoScreen extends StatelessWidget {
  static CreateTodoScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTodoScreen();
  const CreateTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: DisplayWhiteText(text: 'Add new todo'),
        ),
        body: SingleChildScrollView(
            // 스크롤 가능한 위젯의 동작 정의
            // AlwaysScrollableScrollPhysics: 내용이 다 보여도 스크롤 가능
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(title: 'Todo Title', hintText: 'Title'),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            title: 'Date',
                            hintText: 'Aug , 18',
                            readOnly: true,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon:
                                    const FaIcon(FontAwesomeIcons.calendar)))),
                    const Gap(10),
                    Expanded(
                        child: CustomTextField(
                      title: 'Time',
                      hintText: '10:00',
                      readOnly: true,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.clock)),
                    ))
                  ],
                ),
                const Gap(10),
                CustomTextField(
                  title: 'Description',
                  hintText: 'Flutter Practice',
                  maxLines: 6,
                ),
                const Gap(50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary),
                    onPressed: () {},
                    child: DisplayWhiteText(text: 'Save'))
              ],
            )));
  }
}
