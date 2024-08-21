import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget custonRichText(
    {required BuildContext context,
    required VoidCallback widgetToNavigate,
    required String firstText,
    required String secondText}) {
  return InkWell(
    onTap: () {
      widgetToNavigate();
    },
    child: Center(
      child: RichText(
        text: TextSpan(
            style: TextStyle(
                color: BrandColors.mildBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(text: "$firstText "),
              TextSpan(
                  text: secondText,
                  style: const TextStyle(
                      color: BrandColors.primary, fontWeight: FontWeight.w500)),
            ]),
      ),
    ),
  );
}
