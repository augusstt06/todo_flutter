import 'package:flutter/material.dart';
import 'package:todo_flutter/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/widgets/custom_container.dart';
import 'package:todo_flutter/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayWhiteText(
                            text: 'Aug 18, 1995',
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        DisplayWhiteText(text: 'Todolist', fontSize: 40)
                      ]),
                )),
          ],
        ),
        Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomContainer(
                        height: deviceSize.height * 0.3,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 8,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return const Text('Home');
                            })),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    CustomContainer(
                        height: deviceSize.height * 0.25,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 8,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return const Text('Home');
                            })),
                    const Gap(20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary),
                        onPressed: () {},
                        child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: DisplayWhiteText(text: 'Add Todo')))
                  ],
                )))
      ],
    ));
  }
}
