import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:stacked_services/src/stacked_service.dart';

class Utils {
  // final AuthRemoteDataSource _authRemoteDataSource =
  //     locator<AuthRemoteDataSource>();
  // final DialogService _dialogService = locator<DialogService>();
  // final UtilityService _utilityService = locator<UtilityService>();
  // final UserService _userService = locator<UserService>();

  //User? get user => _userService.user;

  static EdgeInsets padding = EdgeInsets.only(
      top: MediaQuery.of(StackedService.navigatorKey!.currentContext!)
              .padding
              .top +
          40.h,
      left: 20.w,
      right: 20.w,
      bottom: 40.h);
  static double statusBarPadding =
      MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top;
  static double get buttonVerticalPadding => Platform.isIOS ? 40.h : 10.h;

  static Color hexToColor(String hexColor) {
    String hex = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hex = 'FF$hexColor';
    }
    final int? temp = int.tryParse(hex, radix: 16);
    return Color(temp ?? 0xFFE41613);
  }

  static BottomNavigationBarItem bottomBarItem(
      {required BuildContext context,
      required String name,
      required String iconPath,
      required String activeIconPath,
      required String semanticlabel,
      required String activeSemanticLabel,
      required bool active}) {
    return BottomNavigationBarItem(
      label: name,
      icon: SvgPicture.asset(
        iconPath,
        height: 20.h,
        width: 20.h,
        color: Color(0xFF8B8B8B),
        semanticsLabel: semanticlabel,
        fit: BoxFit.fill,
      ),
      activeIcon: SvgPicture.asset(activeIconPath,
          height: 20.h,
          width: 20.h,
          color: Color(0xFF04041F),
          semanticsLabel: activeSemanticLabel),
    );
  }

  static BoxDecoration roundedShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(.1),
        spreadRadius: 1,
        blurRadius: 8,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  static int getExtendedVersionNumber(String version) {
    return int.parse(version.replaceAll('.', ''));
  }

  static NumberFormat percentageFormatter(int? decimal) {
    return NumberFormat.simpleCurrency(name: '', decimalDigits: decimal ?? 2);
  }

  static final normalFormatter = NumberFormat('#,###.##')
    ..minimumFractionDigits = 2
    ..maximumFractionDigits = 2;
  // static final GlobalKey<NavigatorState>? navigatorKey = StackedService.nestedNavigationKey(locator<MainViewModel>().currentIndex);
  // static final int navId = locator<MainViewModel>().currentIndex;

  static final SystemUiOverlayStyle light = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle lightWhiteNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light);

  static final SystemUiOverlayStyle lightdarkNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light);

  static final SystemUiOverlayStyle dark = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle darkWhiteNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark);

  static String greetingMessage() {
    final timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      return 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow < 16)) {
      return 'Good Afternoon';
    } else if ((timeNow >= 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Evening';
    }
  }

  static List<DropdownMenuItem<T>> getDropdownItem<T>(List<T> items) {
    return items.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(
          '$value',
          style: Theme.of(StackedService.navigatorKey!.currentContext!)
              .textTheme
              .headlineMedium!
              .copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
        ),
      );
    }).toList();
  }

  static String formatNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      // Convert to thousands (K)
      double value = number / 1000;
      return value.toStringAsFixed(value.truncate() == value ? 0 : 1) + 'K';
    } else {
      // Convert to millions (M)
      double value = number / 1000000;
      return value.toStringAsFixed(value.truncate() == value ? 0 : 1) + 'M';
    }
  }

  static String sliceText(String originalText) {
    int maxLength = 50;
    // Slice the text and add ellipsis if needed
    return originalText.length > maxLength
        ? originalText.substring(0, maxLength) + '...'
        : originalText;
  }

  static bool isEmail(String val) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return emailRegExp.hasMatch(val);
  }

  static bool shouldUpdateApp(String currentVersion, String newVersion) {
    int removeDotsAndConvertToNumber(String version) {
      return int.parse(version.replaceAll('.', ''));
    }

    int v1 = removeDotsAndConvertToNumber(currentVersion);
    int v2 = removeDotsAndConvertToNumber(newVersion);

    return v2 > v1;
  }
}
