import 'package:shipping_clothing_store/core/constants/colors.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/appbar_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/chip_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/text_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:shipping_clothing_store/core/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

class CAppTheme {
  CAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'BeVietNamPro',
    brightness: Brightness.light,
    primaryColor: CColors.primary,
    textTheme: CTextTheme.lightTextTheme,
    chipTheme: CChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
  );

// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'BeVietNamPro',
    brightness: Brightness.dark,
    primaryColor: CColors.primary,
    textTheme: CTextTheme.darkTextTheme,
    chipTheme: CChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
  );
}
