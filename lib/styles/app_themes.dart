import 'package:flutter/material.dart';
import 'package:flutter_getx_example/styles/colors.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.teal,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: AppColors.neutralGrey80,
        ),
      ),
      dividerColor: AppColors.neutralGrey80,
      cardTheme: const CardTheme(color: Colors.white));

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBlue1,
      appBarTheme: const AppBarTheme(
        color: AppColors.darkBlue1,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      radioTheme:
          RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) {
        return (states.contains(MaterialState.selected))
            ? AppColors.primaryYellow
            : Colors.white;
      })),
      dividerColor: Colors.white,
      cardTheme: const CardTheme(color: AppColors.darkBlue2));
}
