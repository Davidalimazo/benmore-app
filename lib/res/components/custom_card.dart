import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomCard extends StatelessWidget {
  final dynamic imageUrl;
  final String userName;
  final String title;
  final bool isNetworkImage;
  final bool isTablet;
  CustomCard({Key? key, required this.imageUrl, required this.userName, required this.title, this.isNetworkImage=true, this.isTablet = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String correctName({required String fullName}){
      return fullName.split(" ").map((e) => Utils.capitalizeFirstLetter(e.toLowerCase())).join(" ");
    }
    return Container(
      width: isTablet ? 739.w : 339.w,
      height: isTablet ? 350.h : 162.h,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: BrandColors.grey12,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(title, textAlign: TextAlign.center, style: TextStyle(
              color: BrandColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: isTablet ? 32.sp : 16.sp
          )),
          CircleAvatar(
            radius: isTablet ? 68.r : 34.r,
            child: ClipOval(
              child:
              isNetworkImage ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: isTablet ? 200 : 100,
                width: isTablet ? 200 : 100,
              ) : Image.file(
                File.fromUri(Uri.parse(imageUrl)),
                fit: BoxFit.cover,
                height: isTablet ? 200 : 100,
                width: isTablet ? 200 : 100,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText("Name", textAlign: TextAlign.center, style: TextStyle(
                  color: BrandColors.grey14,
                  fontWeight: FontWeight.w400,
                  fontSize: isTablet ? 28.sp : 14.sp
              )),
              AutoSizeText(correctName(fullName: userName), textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: isTablet ? 28.sp : 14.sp
              )),
            ],
          )
        ],
      ),
    );
  }
}
