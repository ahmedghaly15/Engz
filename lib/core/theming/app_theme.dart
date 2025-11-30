import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../utils/const_strings.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  AppThemes._();

  static ShadThemeData get darkMode => ShadThemeData(
    colorScheme: const ShadSlateColorScheme.dark(
      background: AppColors.darkBg,
      primary: AppColors.primary,
      foreground: Colors.white,
      primaryForeground: Colors.white,
    ),
    brightness: Brightness.dark,
    primaryButtonTheme: ShadButtonTheme(
      size: ShadButtonSize.lg,
      backgroundColor: AppColors.primary,
      pressedBackgroundColor: AppColors.primary.withAlpha(102),
      height: 48.h,
      decoration: ShadDecoration(
        border: ShadBorder(radius: BorderRadius.circular(4.r)),
      ),
    ),
    textTheme: ShadTextTheme(family: ConstStrings.fontFamily),
    inputTheme: ShadInputTheme(
      inputPadding: _inputPadding,
      style: _textFieldTextStyle,
      placeholderStyle: _textFieldTextStyle.copyWith(
        color: AppColors.colorAFAFAF,
      ),
      decoration: ShadDecoration(
        errorStyle: TextStyle(fontSize: 13.sp, color: Colors.red),
        focusedBorder: _textFieldUnderlineInputBorder(
          borderColor: AppColors.primary,
          width: 2,
        ),
        errorBorder: _textFieldUnderlineInputBorder(
          borderColor: Colors.red,
          width: 1.3,
        ),
        border: _textFieldUnderlineInputBorder(),
        disableSecondaryBorder: true,
      ),
    ),
    sheetTheme: ShadSheetTheme(
      backgroundColor: AppColors.color363636,
      radius: .vertical(top: .circular(32.r)),
      scrollable: false,
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      titleStyle: AppTextStyles.font20Bold,
      descriptionStyle: AppTextStyles.font16Regular,
      removeBorderRadiusWhenTiny: false,
    ),
  );

  static ThemeData materialDarkTheme(BuildContext context) =>
      Theme.of(context).copyWith(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.darkBg,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: AppColors.darkBg,
          elevation: 0,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: Colors.white, fontSize: 0),
          ),
        ),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.disabled)) {
                return AppColors.colorAFAFAF;
              }
              return Colors.white;
            }),
          ),
        ),
      );

  static EdgeInsets get _inputPadding =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);

  static TextStyle get _textFieldTextStyle => AppTextStyles.font16Regular;

  static ShadBorder _textFieldUnderlineInputBorder({
    Color? borderColor,
    double width = 1,
  }) {
    return ShadBorder(
      radius: BorderRadius.circular(4.r),
      top: _inputBorderSide(borderColor, width),
      bottom: _inputBorderSide(borderColor, width),
      left: _inputBorderSide(borderColor, width),
      right: _inputBorderSide(borderColor, width),
    );
  }

  static ShadBorderSide _inputBorderSide(Color? borderColor, double width) {
    return ShadBorderSide(color: borderColor ?? Colors.white, width: width.w);
  }
}
