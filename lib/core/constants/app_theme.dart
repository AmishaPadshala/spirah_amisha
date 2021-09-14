import 'package:flutter/material.dart';
import 'package:spirah/core/utils/globals.dart';
import '../extensions/app_color_extension.dart';

import 'app_settings.dart';

class AppTheme {
  static final ThemeData defTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: appColor.scaffoldBackgroundColor,
      fontFamily: kAppFont,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: appColor.appBarColor,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: appColor.appBarTitleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700))),
      textTheme: TextTheme(
          bodyText2: TextStyle(
              color: appColor.textColor,fontSize: 14)),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: appColor.textColor),
      errorColor: Colors.red);
}
