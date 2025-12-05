import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoCompleteCheckbox extends StatelessWidget {
  const TodoCompleteCheckbox({
    super.key,
    required bool isCompleted,
    void Function(bool)? onChanged,
  }) : _isCompleted = isCompleted,
       _onChanged = onChanged;

  final bool _isCompleted;
  final void Function(bool)? _onChanged;

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
        onChanged: _onChanged,
      ),
    );
  }
}
