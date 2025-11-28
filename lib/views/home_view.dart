import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../core/theming/app_colors.dart';
import '../core/theming/app_text_styles.dart';
import '../core/utils/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showCompleted = false;
  bool showToday = false;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .symmetric(vertical: 16.h, horizontal: 24.w),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    margin: .only(bottom: 32.h),
                    padding: .symmetric(vertical: 5.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha((0.21 * 255).round()),
                      borderRadius: .circular(6.r),
                    ),
                    child: InkWell(
                      radius: 6.r,
                      onTap: () {
                        setState(() {
                          showToday = !showToday;
                        });
                        _scrollToScreenBottom(MediaQuery.heightOf(context));
                      },
                      child: Row(
                        mainAxisSize: .min,
                        spacing: 3.w,
                        children: [
                          Text('Today', style: AppTextStyles.font12Regular),
                          SvgPicture.asset(Assets.svgsArrowDown),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (showToday)
                SliverPadding(
                  padding: .only(top: 16.h, bottom: 8.h),
                  sliver: SliverList.separated(
                    itemCount: 10,
                    itemBuilder: (_, index) => ShadCard(
                      rowCrossAxisAlignment: .center,
                      backgroundColor: AppColors.color363636,
                      radius: .all(.circular(4.r)),
                      padding: .symmetric(vertical: 12.h, horizontal: 10.w),
                      leading: Container(
                        margin: EdgeInsetsDirectional.only(end: 16.w),
                        child: ShadCheckbox(
                          value: index % 2 == 0,
                          decoration: ShadDecoration(
                            shape: BoxShape.circle,
                            border: ShadBorder.all(
                              width: 1.5.w,
                              color: Colors.white.withAlpha(
                                (0.87 * 255).round(),
                              ),
                            ),
                          ),
                          onChanged: (_) {},
                        ),
                      ),
                      title: Text(
                        'Study flutter',
                        style: AppTextStyles.font16Regular,
                      ),
                      description: Row(
                        mainAxisAlignment: .spaceBetween,
                        spacing: 12.w,
                        children: [
                          Expanded(
                            child: Text(
                              'Today at 5:00 PM',
                              style: AppTextStyles.font12Regular.copyWith(
                                color: AppColors.colorAFAFAF,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: .all(8.h),
                            decoration: BoxDecoration(
                              border: .all(
                                color: AppColors.primary,
                                width: 1.w,
                              ),
                            ),
                            child: SvgPicture.asset(Assets.svgsFlag),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (_, _) => SizedBox(height: 16.h),
                  ),
                ),
              SliverToBoxAdapter(
                child: InkWell(
                  radius: 6.r,
                  onTap: () {
                    setState(() {
                      showCompleted = !showCompleted;
                    });
                    _scrollToScreenBottom(MediaQuery.heightOf(context));
                  },
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      padding: .symmetric(vertical: 5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha((0.21 * 255).round()),
                        borderRadius: .circular(6.r),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        spacing: 3.w,
                        children: [
                          Text('Completed', style: AppTextStyles.font12Regular),
                          SvgPicture.asset(Assets.svgsArrowDown),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (showCompleted)
                SliverPadding(
                  padding: .only(top: 16.h, bottom: 8.h),
                  sliver: SliverList.separated(
                    itemCount: 10,
                    itemBuilder: (_, index) => ShadCard(
                      rowCrossAxisAlignment: .center,
                      backgroundColor: AppColors.color363636,
                      radius: .all(.circular(4.r)),
                      padding: .symmetric(vertical: 12.h, horizontal: 10.w),
                      leading: Container(
                        margin: EdgeInsetsDirectional.only(end: 16.w),
                        child: ShadCheckbox(
                          value: index % 2 == 0,
                          decoration: ShadDecoration(
                            shape: BoxShape.circle,
                            border: ShadBorder.all(
                              width: 1.5.w,
                              color: Colors.white.withAlpha(
                                (0.87 * 255).round(),
                              ),
                            ),
                          ),
                          onChanged: (_) {},
                        ),
                      ),
                      title: Text(
                        'Study flutter',
                        style: AppTextStyles.font16Regular,
                      ),
                      description: Row(
                        mainAxisAlignment: .spaceBetween,
                        spacing: 12.w,
                        children: [
                          Expanded(
                            child: Text(
                              'Today at 5:00 PM',
                              style: AppTextStyles.font12Regular.copyWith(
                                color: AppColors.colorAFAFAF,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: .all(8.h),
                            decoration: BoxDecoration(
                              border: .all(
                                color: AppColors.primary,
                                width: 1.w,
                              ),
                            ),
                            child: SvgPicture.asset(Assets.svgsFlag),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (_, _) => SizedBox(height: 16.h),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollToScreenBottom(double screenHeight) {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + screenHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
