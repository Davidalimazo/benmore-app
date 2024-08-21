import 'package:benmore/core/constants/static_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles/colors.dart';
import '../../../styles/text_styles.dart';


class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutConfirmationDialog({
    Key? key,
    required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          width: 350.w,
          height: 250.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10.h,),
              Center(
                child: SvgPicture.asset(
                  Images.appLogo,
                  color: BrandColors.bc1C1939,
                  height: 40.h,
                ),
              ),
              SizedBox(height: 8.h,),
              Text(
                'Are you sure you want to log out?',
                style: BrandTextStyles.bold.copyWith(
                  color: BrandColors.bc1C1939,
                  fontSize: 20.sp
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: BrandColors.primary
                          ),
                          borderRadius: BorderRadius.circular(6.r)
                        ),
                        child: Center(
                          child: Text(
                            'No, cancel',
                            style: BrandTextStyles.semiBold.copyWith(
                              color: BrandColors.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        onLogout();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFED1B23),
                          borderRadius: BorderRadius.circular(6.r)
                        ),
                        child: Center(
                          child: Text(
                            'Yes, proceed',
                            style: BrandTextStyles.semiBold.copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}