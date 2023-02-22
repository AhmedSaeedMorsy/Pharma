import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    //text theme

    textTheme: TextTheme(
      displayMedium: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16.sp,
      ),
      displayLarge: getBoldStyle(
        fontSize: FontSizeManager.s18.sp,
        color: ColorManager.white,
      ),
      displaySmall: getRegularStyle(
        fontSize: FontSizeManager.s18.sp,
        color: ColorManager.grey,
      ),
      headlineSmall: getRegularStyle(
        fontSize: FontSizeManager.s16.sp,
        color: ColorManager.primaryDarkColor,
      ),
      headlineMedium: getRegularStyle(
        fontSize: FontSizeManager.s12.sp,
        color: ColorManager.primaryLightColor,
      ),
      bodySmall: getLightStyle(
        fontSize: FontSizeManager.s10.sp,
        color: ColorManager.black,
      ),
      bodyMedium: getBoldStyle(
        fontSize: FontSizeManager.s14.sp,
        color: ColorManager.primaryLightColor,
      ),
      bodyLarge: getBoldStyle(
        fontSize: FontSizeManager.s12.sp,
        color: ColorManager.primaryDarkColor,
      ),
    ),
  );
}
