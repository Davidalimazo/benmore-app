import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class BrandColors {
  BrandColors();

  static BuildContext context = StackedService.navigatorKey!.currentContext!;
  ThemeMode? themeMode = getThemeManager(context).selectedThemeMode;

  Color get mainBg =>
      themeMode == ThemeMode.dark ? Color(0xFF141414) : Colors.white;
  Color get bcfa =>
      themeMode == ThemeMode.dark ? Color(0xFF525252) : Color(0xFFF2F4FA);
  static const red = Color(0xFFED1B23);
  static const bc1C1939 = Color(0xFF1C1939);
  static const bc010F2E = Color(0xFF010F2E);
  static const bcB6B6C6 = Color(0xFFB6B6C6);
  static const bcED1B23 = Color(0xFFED1B23);
  static const bc979797 = Color(0xFF979797);
  static const bcFCDED7 = Color(0xFFFCDED7);
  static const bcE1F5CC = Color(0xFFE1F5CC);
  static const bcFFE5A4 = Color(0xFFFFE5A4);
  static const bcC2CFFF = Color(0xFFC2CFFF);
  static const bcAAC0F2 = Color(0xFFAAC0F2);
  static const bc263238 = Color(0xFF263238);
  static const bc848484 = Color(0xFF848484);
  static const bcE4E4E4 = Color(0xFFE4E4E4);
  static const bcFAFAFA = Color(0xFFFAFAFA);
  static const bc001A54 = Color(0xFF001A54);
  static const bc2C2948 = Color(0xFF2C2948);
  static const bcF8FAFF = Color(0xFFF8FAFF);
  static const bcF2F4FA = Color(0xFFF2F4FA);
  static const bc031A6E = Color(0xFF031A6E);
  static const bc86BE40 = Color(0xFF86BE40);
  static const bcCBCBDD = Color(0xFFCBCBDD);
  static const bcE3E9ED = Color(0xFFE3E9ED);
  static const bcECF1F6 = Color(0xFFECF1F6);
  static const bc1F2C37 = Color(0xFF1F2C37);
  static const bc9B9AAC = Color(0xFF9B9AAC);
  static const bcBDBDBD = Color(0xFFBDBDBD);
  static const bcEAEEFF = Color(0xFFEAEEFF);
  static const bcBACFFF = Color(0xFFBACFFF);
  static const bcF9F9FB = Color(0xFFF9F9FB);
  static const bc161622 = Color(0xFF161622);
  static const bc9EA6BE = Color(0xFF9EA6BE);
  static const bcEB5757 = Color(0xFFEB5757);
  static const bc5D648A = Color(0xFF5D648A);
  static const bc1CC867 = Color(0xFF1CC867);
  static const bc232949 = Color(0xFF232949);
  static const bcF1FFE2 = Color(0xFFF1FFE2);
  static const bc2F2D51 = Color(0xFF2F2D51);
  static const bcFFF1F3 = Color(0xFFFFF1F3);
  static const bc333333 = Color(0xFF333333);

  static const primaryFade = Color(0xFFFAE1DC);
  static const primaryFade2 = Color(0xFFFFCFCE);
  static const indigo = Color(0xFF4464BE);
  static const light = Color(0xFFF5F5F5);
  static const darkD9 = Color(0xFFD9D9D9);
  static const dark59 = Color(0xFF595175);
  static const darkB7 = Color(0xFFB7BCEE);
  static const dark4B = Color(0xFF2E364B);
  static const green = Color(0xFF24B28A);
  static const green2 = Color(0xFF48DAB1);
  static const paleGreen = Color(0xFF6FCF97);
  static const grey9c = Color(0xFF9C9C9C);
  static const grey4F = Color(0xFF4F5B6B);
  static const grey9B = Color(0xFF9B9AAC);
  static const greyF6 = Color(0xFFF6F6F9);
  static const greyC6 = Color(0xFFC6C6C8);
  static const orangeFF = Color(0xFFFFF0E4);
  static const barGreen = Color(0xFFB1F5C5);
  static const Color primary = Color(0xFFFF7D3F);
  static const Color splashBg = Color(0xFF112768);
  static const Color landingPageImg = Color(0xFF051D64);
  static const Color primary10 = Color(0xFFE4EAFD);
  static const Color primary15 = Color(0xFF1966FC);
  static const Color primary20 = Color(0xFF5270CC);
  static const Color primary30 = Color(0xFF2544A0);
  static const Color primary40 = Color(0xFF102E88);
  static const Color secondary = Color(0xFFED3237);
  static const Color secondary10 = Color(0xFFFEF9F9);
  static const Color secondary20 = Color(0xFFED6E71);
  static const Color secondary30 = Color(0xFFEF484C);
  static const Color info = Color(0xFF3784FB);
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFEFB008);
  static const Color error = Color(0xFFB62424);
  static const Color black = Color(0xFF212121);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey1 = Color(0xFFF6F8FC);
  static const Color grey2 = Color(0xFFF1F4F9);
  static const Color grey3 = Color(0xFFE5E7EB);
  static const Color grey4 = Color(0xFFE7E7E7);
  static const Color grey5 = Color(0xFFD2D6D9);
  static const Color grey6 = Color(0xFF9EA3AE);
  static const Color grey7 = Color(0xFF473F42);
  static const Color grey8 = Color(0xFF444042);
  static const Color grey9 = Color(0xFF3C3939);
  static const Color grey10 = Color(0xFF1D1C1C);
  static const Color grey11 = Color(0xFF6C727F);
  static const Color grey12 = Color(0xFFF6F6F6);
  static const Color grey13 = Color(0xFF6D6D6D);
  static const Color darkGreen = Color(0xFF027F4D);
  static const Color offWhite = Color(0xFFEEFFF8);
  static const Color grey14 = Color(0xFF818181);
  static const Color grey15 = Color(0xFF393434);
  static const Color greyWhite = Color(0xFFFFF2F3);
  static const Color danger = Color(0xFFE20010);
  static const Color greyLightWhite = Color(0xFFD2D6D9);
  static const Color grey = Color(0xFF7D7D7D);
  static const Color lightGrey = Color(0xFF6D6D6D);
  static const Color deepGrey = Color(0xFF6D6D6D);
  static const Color mildBlack = Color(0xFF161616);

  static const misc = Color(0xFFFFCC00);
  static const transportation = Color(0xFFFBC0C0);
  static const food = Color(0xFF6FCE63);
  static const groceries = Color(0xFFB08169);

  static const Map<int, Color> budgetColors = {
    0: transportation,
    1: Color(0xFF2a9d8f),
    2: indigo,
    3: misc,
    5: grey,
    6: food,
    7: Color(0xFFe9c46a),
    8: Color(0xFFf4a261),
    9: Color(0xFFe76f51),
    10: Color(0xFFe63946),
    11: groceries,
    12: Color(0xFF9c6644),
    13: Color(0xFF7209b7)
  };
  static const Map<int, Color> newBudgetColors = {
    0: Color(0xFF03045e),
    1: Color(0xFF240046),
    2: Color(0xFF540b0e),
    3: Color(0xFF3a86ff),
    5: Color(0xFFffbe0b),
    6: Color(0xFFff0a54),
    7: Color(0xFF8ac926),
    8: Color(0xFF00043a),
    9: Color(0xFF450920)
  };
}
