import 'package:auto_size_text/auto_size_text.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/res/components/util_widgets.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDialog extends StatelessWidget {
  final VoidCallback navigateToEdit;
  final VoidCallback navigateToView;

  const PostDialog(
      {super.key, required this.navigateToEdit, required this.navigateToView});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
          width: 310.w,
          height: 213.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post Action',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      Images.close,
                      width: 25.w,
                      height: 25.h,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AutoSizeText(
                  'What do you want to do?',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black, fontSize: 16.sp),
                  maxFontSize: 16,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      onTap: () => navigateToEdit(),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Center(
                            child: Text(
                              'Edit',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                            ),
                          )),
                    ),
                    30.horizontalSpace,
                    InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      onTap: () => navigateToView(),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: BrandColors.primary,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Center(
                            child: Text(
                              'View',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
