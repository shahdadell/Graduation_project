import 'package:flutter/material.dart';

class MyTheme{
  static Color orangeColor = const Color(0xffF87146);
  static Color orangeColor2 = const Color(0xffF26B0A);
  static Color blueColor = const Color(0xff5384EE);
  static Color blueColor2 = const Color(0xff415792);
  static Color blackColor = const Color(0xff000000);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color grayColor = const Color(0xffD6D6D6);
  static Color grayColor2 = const Color(0xff878787);
  static Color greenColor = const Color(0xff4CAF50);
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
      titleMedium: TextStyle(
          color: blackColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}