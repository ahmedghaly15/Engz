import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../theming/app_text_styles.dart';
import '../utils/app_strings.dart';
import '../utils/assets.dart';

class ComingSoonShadDialog extends StatelessWidget {
  const ComingSoonShadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
      closeIcon: const SizedBox.shrink(),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        spacing: 16.h,
        children: [
          Lottie.asset(
            Assets.lottiesComingSoon,
            fit: BoxFit.cover,
            height: 100.h,
          ),
          Text(
            AppStrings.comingSoon,
            style: AppTextStyles.font14Regular.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
