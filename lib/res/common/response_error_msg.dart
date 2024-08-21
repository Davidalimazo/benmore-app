import 'package:benmore/core/constants/app_strings.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


responseErrorMessage({
  required String reasonPhrase,
  dynamic mainHeight,
  dynamic textHeight,
  required BuildContext context,
}) {
  bool isTablet = MediaQuery.of(context).size.width >= 600;
  return Container(
    padding: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 20.h),
    width: MediaQuery.of(context).size.width,
    height: reasonPhrase.length > 50
        ? (isTablet ? 115.h : 98.h)
        : (isTablet ? 98.h : 80.h),
    decoration: BoxDecoration(
        color: BrandColors.greyWhite,
        borderRadius: BorderRadius.circular(isTablet ? 20.r : 10.r)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.error, color: Colors.red, size: 24.h),
        10.horizontalSpace,
        Expanded(
          child: Text(reasonPhrase,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: BrandColors.danger,
                  fontWeight: FontWeight.w400,
                  fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                  fontFamily: AppStrings.poppins)),
        )
      ],
    ),
  );
}
