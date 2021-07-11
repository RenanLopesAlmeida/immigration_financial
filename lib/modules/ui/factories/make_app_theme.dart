import 'package:flutter/material.dart';
import 'package:immigration_financial/modules/ui/factories/make_app_text_theme.dart';

ThemeData makeAppTheme() {
  // final primaryDark3Color = Color(0xff1d1f2e);
  final _titleColor = Color(0xff90ADC6);
  // final _darkColor = Color(0xff040404);

  final _onBackgroundColor = Color(0xffE9EAEC);
  final _highlightColor = Color(0xffFAD02C);
  final _highlightDarkerColor = Color(0xffedc528);
  final _errorColor = Color(0xffff0033);
  final _whiteColor = Color(0xffFFFFFF);

  final _primaryColor = Color(0xff282a40);
  final _primaryColorDark = Color(0xff232538);
  final _primaryColorLight = Color(0xff333652);

  final _buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(primary: _highlightDarkerColor),
    buttonColor: _highlightDarkerColor,
    disabledColor: _primaryColorLight.withOpacity(0.6),
    splashColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final _inputDecorationTheme = InputDecorationTheme(
    alignLabelWithHint: true,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: _primaryColorLight),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
    ),
  );

  return ThemeData(
    primaryColor: _primaryColor,
    primaryColorDark: _primaryColorDark,
    primaryColorLight: _primaryColorLight,
    accentColor: _primaryColor,
    backgroundColor: Colors.white,
    textTheme: MakeAppTextTheme(),
    buttonTheme: _buttonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    scaffoldBackgroundColor: _primaryColor,
    fontFamily: 'NotoSansJP',
    colorScheme: ColorScheme(
      primary: _primaryColor,
      primaryVariant: _primaryColorDark,
      onPrimary: _onBackgroundColor,
      background: _primaryColorDark,
      error: _errorColor,
      onError: _whiteColor,
      onBackground: _onBackgroundColor,
      secondary: _highlightColor,
      secondaryVariant: _highlightDarkerColor,
      onSecondary: _whiteColor,
      surface: _primaryColorDark,
      onSurface: _titleColor,
      brightness: Brightness.dark,
    ),
  );
}
