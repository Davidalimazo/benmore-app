
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedFontSize: isTablet ? 20.sp : 15.sp,
      unselectedFontSize: isTablet ? 18.sp : 14.sp,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: BrandColors.primary,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Images.appLogo, width: isTablet ? 48.w : 24.w, height:isTablet ? 48.h : 24.h,
              colorFilter:ColorFilter.mode(currentIndex == 0 ? BrandColors.primary : BrandColors.greyLightWhite, BlendMode.srcIn)),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(Images.appLogo, width: isTablet ? 48.w : 24.w, height:isTablet ? 48.h : 24.h,
              colorFilter:ColorFilter.mode(currentIndex == 2 ? Theme.of(context).primaryColor : BrandColors.greyLightWhite, BlendMode.srcIn)),
          label: "Help",
        ),
        // Add more items as needed
      ],
    );
  }
}
