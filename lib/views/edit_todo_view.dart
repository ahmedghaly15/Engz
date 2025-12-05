import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../core/theming/app_colors.dart';
import '../core/theming/app_text_styles.dart';
import '../core/utils/app_strings.dart';
import '../core/widgets/custom_sliver_app_bar.dart';
import '../core/widgets/primary_button.dart';
import '../models/todo.dart';
import '../models/todo_detail.dart';
import 'widgets/edit_todo_item.dart';
import 'widgets/todo_detail_list_tile.dart';

class EditTodoView extends StatelessWidget {
  const EditTodoView({super.key, required Todo todo}) : _todo = todo;

  final Todo _todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(vertical: 16.h, horizontal: 24.w),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const CustomSliverAppBar(),
              SliverToBoxAdapter(
                child: Container(
                  margin: .only(top: 16.h, bottom: 38.h),
                  child: EditTodoItem(todo: _todo),
                ),
              ),
              SliverList.separated(
                itemCount: _buildDetails(_todo).length,
                separatorBuilder: (_, _) => SizedBox(height: 34.h),
                itemBuilder: (_, index) {
                  final item = _buildDetails(_todo)[index];
                  return TodoDetailListTile(
                    detailIcon: item.detailIcon,
                    detailTitle: item.detailTitle,
                    detailContent: item.detailContent,
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: .only(top: 29.h),
                  child: ShadButton.ghost(
                    padding: .zero,
                    mainAxisAlignment: .start,
                    onPressed: () {},
                    gap: 11.w,
                    leading: const Icon(
                      LucideIcons.trash2,
                      color: AppColors.colorFF4949,
                    ),
                    child: Text(
                      '${AppStrings.delete} ${AppStrings.task}',
                      style: AppTextStyles.font16Regular.copyWith(
                        color: AppColors.colorFF4949,
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    PrimaryButton(
                      onPressed: () {},
                      text: '${AppStrings.edit} ${AppStrings.task}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<TodoDetailItem> _buildDetails(Todo todo) {
    return [
      TodoDetailItem(
        detailIcon: LucideIcons.clock12,
        detailTitle: '${AppStrings.task} ${AppStrings.time}',
        detailContent: Text(
          '${DateFormat.MMMd().format(todo.dateTime!)} '
          'at ${DateFormat.jm().format(todo.dateTime!)}',
        ),
      ),
      TodoDetailItem(
        detailIcon: LucideIcons.layoutGrid,
        detailTitle: '${AppStrings.task} ${AppStrings.category}',
        detailContent: Row(
          spacing: 8.w,
          children: [
            SvgPicture.asset(
              todo.category!.iconPath,
              height: 24.h,
              width: 24.h,
            ),
            Text(todo.category!.typeName, style: AppTextStyles.font12Regular),
          ],
        ),
      ),
      TodoDetailItem(
        detailIcon: LucideIcons.flag,
        detailTitle: '${AppStrings.task} ${AppStrings.priority}',
        detailContent: Text('${todo.priority}'),
      ),
    ];
  }
}
