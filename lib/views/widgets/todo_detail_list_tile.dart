import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/app_text_styles.dart';

class TodoDetailListTile extends StatelessWidget {
  const TodoDetailListTile({
    super.key,
    required IconData detailIcon,
    required String detailTitle,
    required Widget detailContent,
  }) : _detailIcon = detailIcon,
       _detailTitle = detailTitle,
       _detailContent = detailContent;

  final IconData _detailIcon;
  final String _detailTitle;
  final Widget _detailContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Icon(_detailIcon, color: Colors.white),
        Text(
          '$_detailTitle:',
          style: AppTextStyles.font16Regular.copyWith(color: Colors.white),
        ),
        const Spacer(),
        Container(
          padding: .symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: (Colors.white).withAlpha((0.21 * 255).round()),
            borderRadius: .circular(6.r),
          ),
          child: _detailContent,
        ),
      ],
    );
  }
}
