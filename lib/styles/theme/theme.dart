

import 'package:benmore/core/utils/utils.dart';
import 'package:flutter/material.dart';


ThemeData darkTheme = ThemeData(
  primarySwatch: createMaterialColor(Color(0xFFF5F5F5)),
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  fontFamily: 'Inter',
  iconTheme: IconThemeData(
    color: Colors.white
  ),
  // floatingActionButtonTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: createMaterialColor(Color(0xFF001A54)),
  primaryColor: Color(0xFF001A54),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: Utils.darkWhiteNav,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  // primaryTextTheme: TextTheme(
  //   titleLarge: TextStyle().copyWith(
  //     color: BrandColors.bc1C1939,
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.w600,
  //     letterSpacing: -0.02,
  //     height: 1.25
  //   )
  // ),
  iconTheme: IconThemeData(
    color: Colors.white
  ),
  fontFamily: 'Inter',
  dividerColor: Colors.black12,
  // cardColor: Colors.white54
);

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}