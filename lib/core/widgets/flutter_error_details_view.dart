import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../helpers/extensions.dart';
import '../utils/app_strings.dart';

class FlutterErrorDetailsView extends StatelessWidget {
  const FlutterErrorDetailsView({super.key, required this.details});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 24.w),
        child: Column(
          spacing: 16.h,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            const Flexible(child: Icon(LucideIcons.circleAlert)),
            Text(
              AppStrings.defaultError,
              style: context.shadTextTheme.h4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
