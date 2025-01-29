import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_flutter/providers/category_provider.dart';
import 'package:todo_flutter/utils/utils.dart';
import 'package:todo_flutter/widgets/circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TodoCategory.values.toList();
    final selectedCategory = ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleMedium),
          const Gap(10),
          Expanded(
              child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: CircleContainer(
                        color: category.color.withOpacity(0.5),
                        child: Icon(category.icon,
                            color: category == selectedCategory
                                ? context.colorScheme.primary
                                : category.color),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(8),
                  itemCount: categories.length))
        ],
      ),
    );
  }
}
