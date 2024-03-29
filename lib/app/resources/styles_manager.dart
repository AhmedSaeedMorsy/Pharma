import 'package:flutter/material.dart';

import '../services/shared_prefrences/cache_helper.dart';
import 'font_manager.dart';
import 'language_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: CacheHelper.getData(key: SharedKey.Language) ==
                LanguageType.ENGLISH.getValue() ||
            CacheHelper.getData(key: SharedKey.Language) == null
        ? FontConstance.fontFamily
        : FontConstance.fontFamilyAr,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// bold weight
TextStyle getBoldStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
  );
}

// light weight
TextStyle getLightStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
  );
}

// medium weight
TextStyle getMediumStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
  );
}

// regular weight
TextStyle getRegularStyle({
  required double fontSize,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
  );
}
