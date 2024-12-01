import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/foundations/font_fundation.dart';
import 'package:task/core/design/utils/material_color.dart';

class AppTheme {
  
  AppTheme._();

  static ThemeData getTheme() => ThemeData(
    primaryColor: ColorFoundation.background.blue,
    primarySwatch: createMaterialColor(ColorFoundation.background.blue),
    scaffoldBackgroundColor: ColorFoundation.background.white,
    textTheme: TextTheme(
      bodyMedium: FontFoundation.paragraph.medium14Black,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorFoundation.background.blue,
      selectionColor: ColorFoundation.background.blue.withOpacity(0.2),
      selectionHandleColor: ColorFoundation.background.blue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorFoundation.background.black,
      ),
      hintStyle: TextStyle(
        color: ColorFoundation.background.black,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorFoundation.background.blue.withOpacity(0.4),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorFoundation.background.blue.withOpacity(0.8),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.white : ColorFoundation.background.blue.withOpacity(0.5)), 
        foregroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.white : ColorFoundation.background.black),
        backgroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue.withOpacity(0.5) : ColorFoundation.background.white), 
      )
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorFoundation.background.white,
      headerBackgroundColor: ColorFoundation.background.white2,
      headerForegroundColor: ColorFoundation.background.black,
      surfaceTintColor: ColorFoundation.background.transparent,
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue.withOpacity(0.8) : ColorFoundation.background.blue), 
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue.withOpacity(0.8) : ColorFoundation.background.blue), 
      ),
      yearOverlayColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue : ColorFoundation.background.blue.withOpacity(0.4)),
      yearBackgroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue : ColorFoundation.background.blue.withOpacity(0.4)),
      yearForegroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.white : ColorFoundation.background.white),
      dayBackgroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue : ColorFoundation.background.transparent),
      dayForegroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.white : ColorFoundation.background.black),
      todayBackgroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.blue : ColorFoundation.background.transparent),
      todayForegroundColor: MaterialStateColor.resolveWith((Set<WidgetState> states) => states.contains(MaterialState.selected) ? ColorFoundation.background.white : ColorFoundation.background.black),
    ),
  );
}
