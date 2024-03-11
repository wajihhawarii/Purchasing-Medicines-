import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDate() {
  return ThemeData(
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
          fontStyle: FontStyle.italic),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
    ),
  );
}
