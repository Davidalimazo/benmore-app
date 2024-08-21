import 'dart:io';

import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/services/utility_service.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked_services/stacked_services.dart';
export 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

Widget handle({Color? color}) {
  return Container(
    width: 60.w,
    height: 4.h,
    decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(50.r)),
  );
}

Widget appHeader(
        {required BuildContext context,
        required VoidCallback navigator,
        required String userImage,
        required bool isVerified}) =>
    ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                navigator();
              },
              child: Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(userImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Darrel Steward", // Update with actual name if needed
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      isVerified
                          ? SvgPicture.asset(
                              Images.verified,
                              color: Color(0xFFFF7D3F),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Yesterday at 11:30", // Update with actual time if needed
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color.fromARGB(255, 180, 178, 178),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget StatCard({required int total, required String statName}) => Container(
      width: 110.w,
      height: 100.h,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Utils.formatNumber(total),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            statName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );

Widget reactionSkeleton(
        {required BuildContext context, required List<int> count}) =>
    Column(
      children: [
        ...count.map((number) => SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 80.0,
              child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 104, 104, 104),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      10.verticalSpace
                    ],
                  )),
            )),
      ],
    );

Widget bannerSkeleton({required BuildContext context}) => Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.40,
        child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 104, 104, 104),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );

String message(dynamic data, String? responseCodeError) {
  return (data['message'] == null ||
          data['message'].isEmpty ||
          data['message'] == '')
      ? data['validationErrors'].join() as String
      : (data['validationErrors'] == null ||
              data['validationErrors'].isEmpty ||
              data['validationErrors'] == '')
          ? data['message']
          : responseCodeError ?? 'An error occurred';
}

void showCustomBottomSheet(
    {required BuildContext context,
    required Widget Function(BuildContext, ScrollController) builder,
    bool showCloseIcon = true,
    Function? whenComplete,
    Color? backgroundColor,
    double initialChildSize = .5,
    double minChildSize = .5,
    double maxChildSize = .5}) {
  assert(minChildSize >= initialChildSize,
      'min height cant be more than initial height');
  assert(
      minChildSize <= maxChildSize, 'min height cant be more than max height');
  assert(initialChildSize <= maxChildSize,
      'initial height cant be more than max height');
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? Colors.white,
      builder: (c) => ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            child: Container(
                // color: Colors.white,
                child: DraggableScrollableSheet(
                    initialChildSize: initialChildSize,
                    minChildSize: minChildSize,
                    maxChildSize: maxChildSize,
                    expand: false,
                    builder: (c, s) => Material(
                          color: backgroundColor ?? Colors.white,
                          child: !showCloseIcon
                              ? builder(c, s)
                              : Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 38.h,
                                        ),
                                        Expanded(child: builder(c, s)),
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 24.h, right: 24.h),
                                        child: InkWell(
                                          onTap: () => Navigator.pop(context),
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SvgPicture.asset(''),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ))),
          )).whenComplete(() {
    if (whenComplete != null) {
      whenComplete();
    }
  });
}

void bottomModalSetup(
    {required BuildContext context,
    required Widget child,
    double? height,
    bool isDismissible = true,
    bool enableDrag = true}) {
  final bool initialNavStatus = locator<UtilityService>().showNav;
  locator<UtilityService>().setShowNav(false);
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r))),
      context: context,
      enableDrag: enableDrag,
      // topRadius: Radius.circular(32.r),
      // isScrollControlled: true,
      isDismissible: isDismissible,
      barrierColor: Colors.black.withOpacity(.5),
      backgroundColor: Colors.transparent,
      builder: (c) => ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
          child: Material(
            child: SizedBox(height: height, child: child),
          ))).whenComplete(() {
    if (initialNavStatus) locator<UtilityService>().setShowNav(true);
  });
}

Future infoModal(
    {required BuildContext context,
    required String url,
    required String title,
    Function? onClose,
    bool showButton = true,
    bool showNav = true}) {
  locator<UtilityService>().setShowNav(false);
  return showModalBottomSheet(
      isDismissible: false,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.r),
        topLeft: Radius.circular(20.r),
      )),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      enableDrag: false,
      builder: (c) => SizedBox(
            height: 600.w,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 15.h, bottom: 15.h, left: 18.w, right: 10.w),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[300]!))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => onClose == null
                            ? locator<NavigationService>().back()
                            : onClose(),
                        icon: Icon(
                          Icons.close,
                          size: 20.h,
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Text(""),
                ),
                if (showButton)
                  InkWell(
                    onTap: () => locator<NavigationService>().back(),
                    child: Container(
                      color: BrandColors.primary,
                      padding: EdgeInsets.only(
                          top: 20.h, bottom: Platform.isIOS ? 40.h : 20.h),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Accept',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox()
              ],
            ),
          )).whenComplete(() {
    if (showNav) locator<UtilityService>().setShowNav(true);
  });
}
