import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/core/utils/dashboard_data.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/res/bottom_sheets/message_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DashboardCard extends StatefulWidget {
  final DashboardItem dashboardItem;

  const DashboardCard({super.key, required this.dashboardItem});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0)),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.40,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            image: DecorationImage(
              image: NetworkImage(widget.dashboardItem.imageUrl),
              fit:
                  BoxFit.fill, // Adjust how the image fits within the container
            ),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: Color(0xFFA88282), shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Center(
                              child: SvgPicture.asset(
                            isLiked ? Images.heart : Images.heartOuttline,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: Color(0xFFA88282), shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                              child: SvgPicture.asset(
                            Images.vEllipsis,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      13.verticalSpace,
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: Color(0xFFA88282), shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {
                            sendCommentSheet(context: context);
                          },
                          child: Center(
                              child: SvgPicture.asset(
                            Images.messagesFilled,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 100.h,
                      child: Text(
                        Utils.sliceText(widget.dashboardItem.caption),
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
