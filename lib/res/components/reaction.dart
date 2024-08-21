import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/core/utils/dashboard_data.dart';
import 'package:benmore/res/bottom_sheets/reply_bottom_sheet.dart';
import 'package:benmore/ui/dashboard/dashboard_vmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class Reaction extends StatefulWidget {
  // final String userId;
  // final String timeStamp;
  // final String name;
  // final int likes;
  // final bool isVerified;
  // final String imageUrl;
  // final String message;

  final ReactionItem reactionItem;

  const Reaction({
    super.key,
    required this.reactionItem,
    // required BuildContext context,
    // required this.timeStamp,
    // required this.isVerified,
    // required this.name,
    // required this.likes,
    // required this.imageUrl,
    // required this.onLike,
  });

  @override
  State<Reaction> createState() => _ReactionState();
}

class _ReactionState extends State<Reaction> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DashboardVmodel(),
        builder: (context, viewModel, child) => Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      viewModel.navigateToProfile(
                          userId: "HJJHHJJsjhjher", isSelf: false);
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.reactionItem.imageUrl),
                          fit: BoxFit
                              .fill, // Adjust how the image fits within the container
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.reactionItem
                                .name, // Update with actual name if needed
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          widget.reactionItem.isVerified
                              ? SvgPicture.asset(
                                  Images.verified,
                                  color: Color(0xFFFF7D3F),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      5.verticalSpace,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Text(
                          widget.reactionItem.message,
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Color.fromARGB(255, 38, 38, 38)),
                        ),
                      ),
                      5.verticalSpace,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.reactionItem.timeStamp,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color.fromARGB(
                                          255, 180, 178, 178)),
                                ),
                                5.horizontalSpace,
                                InkWell(
                                    child: Text(
                                      "Reply",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Color(0xFFFF7D3F)),
                                    ),
                                    onTap: () {
                                      replyCommentSheet(context: context);
                                    }),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                    if (isLiked) {
                                      widget.reactionItem.likes += 1;
                                    } else {
                                      widget.reactionItem.likes -= 1;
                                    }
                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(
                                      isLiked
                                          ? Images.heart
                                          : Images.heartOuttline,
                                      width: 20,
                                      height: 20),
                                ),
                                5.horizontalSpace,
                                Text(
                                  "${widget.reactionItem.likes}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ));
  }
}
