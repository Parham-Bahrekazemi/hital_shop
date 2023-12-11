import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeHelper extends GetxController {
  ThemeData defaultTheme = ThemeData(
    fontFamily: 'Vazir',
    primaryColor: const Color(0xff14489E),
    primaryColorLight: const Color(0xffED723F),
    scaffoldBackgroundColor: const Color(0xffF8F8F8),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xff3A3A3A),
      ),
    ),
    dividerColor: const Color(0xffE1E1E1),
    hintColor: const Color(0xffB4B4B4),
  );
}
