import 'package:auto_size_text/auto_size_text.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget buildItem({
  required String title,
  required String value,
  bool isTablet=false
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: isTablet ? 160.w : 80.w,
        child: Text(title, style: TextStyle(
            color: BrandColors.grey15,
            fontSize: isTablet ? 28.sp : 14.sp,
            fontWeight: FontWeight.w700
        ),),
      ),
      15.horizontalSpace,
      Text(value, style: TextStyle(
          color: BrandColors.grey15,
          fontSize: isTablet ? 28.sp : 14.sp,
          fontWeight: FontWeight.w400
      ),),
    ],
  );
}

Widget rowItem({
  required String title,
  required String value,
  bool isTablet=false
}){
  return  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AutoSizeText(title, textAlign: TextAlign.center, style: TextStyle(
          color: BrandColors.grey14,
          fontWeight: FontWeight.w400,
          fontSize: isTablet ? 28.sp : 14.sp
      ),maxLines: 1),
      AutoSizeText(
        value,
        textAlign: TextAlign.center, style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: isTablet ? 28.sp : 14.sp
      ),maxLines: 1),
    ],
  );
}