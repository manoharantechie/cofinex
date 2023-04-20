import 'package:flutter/material.dart';

enum MyThemeKeys {
  LIGHT,
  DARK,
}

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF01081E),
      backgroundColor: Color(0xFFF2F2F2),
      focusColor: Color(0xFFFFFFFF),
      bottomAppBarColor: Color(0xFF000000),
      disabledColor: Color(0xFF8B9CAE),
      accentColor: Color(0xFFB8B8B8),
      canvasColor: Color(0xFF848484),
      cardColor: Color(0xFF014958),
      dividerColor: Color(0xFFEBEBEB),
      // cursorColor: Color(0xFF0e1839),
      buttonColor: Color(0xFF00C4C3),
      secondaryHeaderColor: Color(0xFF00C4C3),
      splashColor: Color(0xFFE8E8E8),
      highlightColor: Color(0xFFF7F7F7),
      errorColor: Color(0xFFffffff),
      hintColor: Color(0xFF202020),
      hoverColor: Color(0xFF77838F),
      indicatorColor: Color(0xFF1ABC7B),
      selectedRowColor: Color(0xFFFAAD34),
      scaffoldBackgroundColor: Color(0xFFD52E2E),
      dialogBackgroundColor: Color(0xFFA0A0A0),
      toggleableActiveColor: Color(0xFFD9D9D9));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFFFFFFFF),
      backgroundColor: Color(0xFF1B1F28),
      focusColor: Color(0xFF000112),
      bottomAppBarColor: Color(0xFFFFFFFF),
      disabledColor: Color(0xFF8B9CAE),
      accentColor: Color(0xFFB8B8B8),
      canvasColor: Color(0xFF848484),
      cardColor: Color(0xFF136E82),
      dividerColor: Color(0xFFEBEBEB),
      buttonColor: Color(0xFF00C4C3),
      // cursorColor: Color(0xFFFFFFFF),
      splashColor: Color(0xFF001253),
      highlightColor: Color(0xFF000112),
      errorColor: Color(0xFFFFFFFF),
      hintColor: Color(0xFF202020),
      hoverColor: Color(0xFF77838F),
      secondaryHeaderColor: Color(0xFFFFFFFF),
      indicatorColor: Color(0xFF1ABC7B),
      selectedRowColor: Color(0xFFFAAD34),
      scaffoldBackgroundColor: Color(0xFFD52E2E),
      dialogBackgroundColor: Color(0xFFA0A0A0),
      toggleableActiveColor: Color(0xFFD9D9D9));

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
