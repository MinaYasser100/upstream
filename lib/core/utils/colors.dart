import 'package:flutter/material.dart';

class ColorsTheme {
  ColorsTheme._();

  static final ColorsTheme _instance = ColorsTheme._();

  factory ColorsTheme() => _instance;

  // الألوان الأصلية
  final primaryColor = const Color(0xFF4A90E2); // Azure Blue
  final primaryLight = const Color(0xFF7ABAF2); // Light Blue
  final primaryDark = const Color(0xFF2E4374); // Dark Blue
  final whiteColor = Colors.white;
  final backgroundColor = const Color(0xFFF5F7FA); // Light Grayish Blue
  final cardColor = Colors.white;
  final errorColor = Colors.red;
  final textColor = const Color(0xFF333333); // Dark Gray للنصوص
  final accentColor = const Color(0xFFFFA726); // Orange للتفاصيل المميزة
  final eventHighlightColor = const Color(0xFFE8F0FE); // خلفية مميزة للأحداث

  // ألوان جديدة للتصميم الفاخر
  final gradientStart = const Color(0xFF2E4374); // بداية التدرج
  final gradientEnd = const Color(0xFF4A90E2); // نهاية التدرج
  final iconColor = const Color(0xFFFFA726); // لون الأيقونات
}
