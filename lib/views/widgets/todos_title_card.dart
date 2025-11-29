import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_text_styles.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/home/todo_state.dart';
import 'inherited_scroll_controller.dart';

class TodosTitleCard extends StatelessWidget {
  const TodosTitleCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: ShadCard(
        padding: .symmetric(vertical: 5.h, horizontal: 10.w),
        backgroundColor: Colors.white.withAlpha((0.21 * 255).round()),
        radius: .circular(6.r),
        child: GestureDetector(
          onTap: () => _onTap(context),
          child: Row(
            mainAxisSize: .min,
            spacing: 3.w,
            children: [
              Text(title, style: AppTextStyles.font12Regular),
              const _IconBlocSelector(),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    final screenHeight = MediaQuery.heightOf(context);
    final scrollController = InheritedScrollController.of(context);
    context.read<TodoCubit>().toggleShowCompleted();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + screenHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}

class _IconBlocSelector extends StatelessWidget {
  const _IconBlocSelector();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, bool>(
      selector: (state) => state.showCompleted,
      builder: (context, isCompletedShown) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        ),
        child: Icon(
          isCompletedShown ? LucideIcons.chevronUp : LucideIcons.chevronDown,
          key: ValueKey(isCompletedShown), // Important!
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
