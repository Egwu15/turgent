import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  primaryColor:  Colors.blue.shade700,
  appBarTheme: AppBarTheme(
    color: Colors.blue.shade700,
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
  ),
  textTheme: TextTheme(
      button: TextStyle(
          color: Colors.blue,
          // backgroundColor: Color(0xff0FC874),
          fontSize: 18,
          letterSpacing: 2,
          fontWeight: FontWeight.w700),
      bodyText1: TextStyle(),
      headline2: TextStyle(),
      headline3: TextStyle(),
      headline4: TextStyle(),
      headline1: TextStyle(),
      subtitle1: TextStyle(),
      subtitle2: TextStyle(
        fontSize: 10,
        color: Color(0xff8e8e8e),
      ),
      headline6: TextStyle(
        color: Color(0xffF5F5F5),
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      bodyText2: TextStyle(),
      caption: TextStyle(
        color: Colors.black,
      )),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
