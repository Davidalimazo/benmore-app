
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


greyButton({
 required VoidCallback function,
  String? icon,
  required String text
})=>Container(
  height: 63,
  width: 335,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.only(bottom: 16),
  decoration: BoxDecoration(
      color: BrandColors.grey12,
      borderRadius: BorderRadius.circular(48)
  ),
  child: InkWell(
    onTap:function,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       icon != null ? SvgPicture.asset(icon) : const SizedBox.shrink(),
        icon != null ? const SizedBox(width: 20): const SizedBox.shrink(),
        Text(text,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: BrandColors.lightGrey
          ),),
      ],
    ),
  ),
);

coloredButton({
  required String text,
  Color? color,
  bool isTablet =false
})=>Container(
  height: 63,
  width: 335,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.only(bottom: 16),
  decoration: BoxDecoration(
      color: color != null ? color : BrandColors.grey12,
      borderRadius: BorderRadius.circular(48.r)
  ),
  child:
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: isTablet ? 32 : 16,
                  color: BrandColors.darkGreen
              ),),
          ),
        ),
);