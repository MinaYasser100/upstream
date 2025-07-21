import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeDataFunc() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsTheme().whiteColor,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsTheme().primaryDark),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsTheme().primaryDark,
      foregroundColor: ColorsTheme().whiteColor,
    ),
    useMaterial3: true,
  );
}
