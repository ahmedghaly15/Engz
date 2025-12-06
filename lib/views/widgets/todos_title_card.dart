import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../core/theming/app_text_styles.dart';
import '../../cubits/home/todo_cubit.dart';
import '../../cubits/home/todo_state.dart';
import '../utils/fade_scale_transition_builder.dart';

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
          onTap: () => context.read<TodoCubit>().toggleShowCompleted(),
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

  // void _onTap(BuildContext context) {
  //   final todoCubit = context.read<TodoCubit>();
  //   todoCubit.toggleShowCompleted();

  //   // We only scroll when we just SHOW completed todos
  //   if (!todoCubit.state.showCompleted) return;

  //   // Defer until after the frame so slivers are laid out
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final scrollController = InheritedScrollController.of(context);
  //     if (!scrollController.hasClients) return;

  //     final position = scrollController.position;
  //     final screenHeight = MediaQuery.sizeOf(context).height;

  //     // How much content is still below the current scroll offset
  //     final remainingScroll = position.maxScrollExtent - position.pixels;

  //     // ✅ Only scroll if there's more than one full screen of content below
  //     if (remainingScroll <= screenHeight) return;

  //     // You can choose:
  //     // 1) Scroll just one screen down:
  //     final targetOffset = (position.pixels + screenHeight).clamp(
  //       0.0,
  //       position.maxScrollExtent,
  //     );

  //     // 2) Or scroll all the way to the bottom:
  //     // final targetOffset = position.maxScrollExtent;

  //     scrollController.animateTo(
  //       targetOffset,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   });
  // }
}

class _IconBlocSelector extends StatelessWidget {
  const _IconBlocSelector();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, bool>(
      selector: (state) => state.showCompleted,
      builder: (context, isCompletedShown) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: fadeScaleTransitionBuilder,
        child: Icon(
          isCompletedShown ? LucideIcons.chevronUp : LucideIcons.chevronDown,
          key: ValueKey(isCompletedShown), // Important!
          color: Colors.white,
        ),
      ),
    );
  }
}
