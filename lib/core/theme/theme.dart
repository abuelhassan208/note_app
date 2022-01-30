import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var _colorLight = Colors.purpleAccent.shade100;
var _colorDark = Colors.black;

ThemeData light() => ThemeData(
      primaryColor: _colorDark,
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: _colorLight,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: _colorDark),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _colorLight,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
        color: _colorLight,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: _colorDark,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(),
    );

ThemeData dark() => ThemeData(
      primaryColor: _colorLight,
      scaffoldBackgroundColor: _colorDark,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: _colorLight),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _colorDark,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        color: _colorDark,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: _colorLight,
          fontSize: 25,
        ),
      ),
    );
