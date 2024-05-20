import 'package:flutter/material.dart';
import 'package:test_task_kanban/common/app_color.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.background,
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColor.progressIndicatorColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(
        Color(0xFFE4F2FF),
      ),
      maximumSize: const WidgetStatePropertyAll(Size(140, 28)),
      minimumSize: const WidgetStatePropertyAll(Size(140, 28)),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColor.textButton,
        ),
      ),
      foregroundColor: const WidgetStatePropertyAll(
        AppColor.textButton,
      ),
    ),
  ),
);
