import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.white,

    // Cấu hình Card
    cardTheme: CardThemeData(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: 4,
    ),

    // Cấu hình AppBar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      elevation: 0,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
    ),

    // Cấu hình Button
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
    ),
  );
}
