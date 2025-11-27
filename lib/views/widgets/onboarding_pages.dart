import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/app_text_styles.dart';
import '../../core/utils/consts.dart';
import 'dot_indicator.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pagesCount = Consts.onboardingPages.length;
    return PageView.builder(
      controller: _pageController,
      scrollDirection: .horizontal,
      itemCount: pagesCount,
      itemBuilder: (_, index) {
        final page = Consts.onboardingPages[index];
        return Column(
          crossAxisAlignment: .center,
          children: [
            Image.asset(page.imgPath),
            Container(
              margin: .symmetric(vertical: 50.h),
              child: Row(
                mainAxisAlignment: .center,
                spacing: 8.w,
                children: List.generate(
                  pagesCount,
                  (index) => const DotIndicator(isActive: true),
                  growable: false,
                ),
              ),
            ),
            Container(
              margin: .only(bottom: 40.h),
              child: Text(
                page.title,
                style: AppTextStyles.font32Bold,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              page.description,
              style: AppTextStyles.font16Regular,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
