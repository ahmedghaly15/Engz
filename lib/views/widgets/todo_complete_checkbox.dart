import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../cubits/home/todo_cubit.dart';

class TodoCompleteCheckbox extends StatelessWidget {
  const TodoCompleteCheckbox({
    super.key,
    required bool isCompleted,
    required String id,
  }) : _isCompleted = isCompleted,
       _id = id;

  final bool _isCompleted;
  final String _id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 16.w),
      child: ShadCheckbox(
        value: _isCompleted,
        decoration: ShadDecoration(
          shape: BoxShape.circle,
          border: ShadBorder.all(
            width: 1.5.w,
            color: Colors.white.withAlpha((0.87 * 255).round()),
          ),
        ),
        onChanged: (_) => context.read<TodoCubit>().toggleCompleteTodo(_id),
      ),
    );
  }
}
