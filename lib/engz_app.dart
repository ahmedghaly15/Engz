import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/utils/const_strings.dart';

class EngzApp extends StatelessWidget {
  const EngzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => ShadApp.custom(
        appBuilder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ConstStrings.appTitle,
          builder: (_, child) => ShadAppBuilder(child: child),
        ),
      ),
    );
  }
}
