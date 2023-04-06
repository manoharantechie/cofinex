import 'package:flutter/material.dart';

enum MyThemeKeys {
  LIGHT,
  DARK,
}

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      primaryColor:Color(0xFFFFFFFF),
      backgroundColor: Color(0xFFFFFFFF),
      brightness: Brightness.light,
      disabledColor: Color(0xFF3068FA),
      accentColor: Color(0xFFFFFFFF),
      bottomAppBarColor: Color(0xFFFFFFFF),
      canvasColor: Color(0xFFFB4160),
      cardColor: Color(0xFF136E82),
      dividerColor: Color(0xFF233446),
      buttonColor: Color(0xFF136E82),
      // cursorColor: Color(0xFFFFFFFF),
      splashColor: Color(0xFF032621),
      focusColor: Color(0xFFFFFFFF),
      highlightColor: Color(0xFF8B9CAE),
      errorColor: Color(0xFFDD2942),
      hintColor: Color(0xFF0e1839),
      hoverColor: Color(0xFF8B9CAE),
      secondaryHeaderColor:Color(0xFFFFFFFF),
      indicatorColor: Color(0xFF1B9368),
      selectedRowColor: Color(0xFFFAAD34),

      scaffoldBackgroundColor: Color(0xFFDD2942)
  );


  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF01081E),
      backgroundColor: Color(0xFFF2F2F2),
      disabledColor: Color(0xFF8B9CAE),
      focusColor: Color(0xFFFFFFFF),
      accentColor: Color(0xFFB8B8B8),
      bottomAppBarColor: Color(0xFF000000),
      canvasColor: Color(0xFFFB4160),
      cardColor: Color(0xFF014958),
      dividerColor: Color(0xFF233446),
      // cursorColor: Color(0xFF0e1839),
      buttonColor: Color(0xFF00C4C3),
      secondaryHeaderColor: Color(0xFF1A94AE),
      splashColor: Color(0xFFFFFFFF),
      highlightColor: Color(0xFF8B9CAE),
      errorColor: Color(0xFFffffff),
      hintColor: Color(0xFFffffff),
      hoverColor: Color(0xFF000000),
      indicatorColor: Color(0xFF1B9368),
      selectedRowColor: Color(0xFFFAAD34),
      scaffoldBackgroundColor: Color(0xFFDD2942)
  );

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
