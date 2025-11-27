import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/router/app_router.dart';
import 'core/theming/app_theme.dart';
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
        theme: AppThemes.darkMode,
        themeMode: ThemeMode.dark,
        appBuilder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ConstStrings.appTitle,
          theme: AppThemes.materialDarkTheme(context),
          builder: (_, child) => ShadAppBuilder(child: child),
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
