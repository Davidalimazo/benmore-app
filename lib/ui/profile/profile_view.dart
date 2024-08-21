import 'package:benmore/core/utils/dashboard_data.dart';
import 'package:benmore/res/components/buttons/custom_icon_button.dart';
import 'package:benmore/res/components/custome_drawer.dart';
import 'package:benmore/res/components/dialogs/post_dialog.dart';
import 'package:benmore/res/components/util_widgets.dart';
import 'package:benmore/ui/profile/profile_vmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/res/common/disable_backbtn/disable_backbtn_view.dart';

import 'package:stacked/stacked.dart';

class ProfileView extends StatefulWidget {
  final String userId;
  final bool isSelf;
  const ProfileView({super.key, required this.userId, required this.isSelf});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (model) {
        // Optional: Perform any additional setup
      },
      builder: (context, viewModel, child) => DisableBackButton(
        child: Scaffold(
          drawer: CustomDrawer(isFinalStep: false),
          backgroundColor: Color(0xFFF1F3F6),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Builder(builder: (context) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                viewModel.navigateBack();
                              },
                              child: Icon(Icons.arrow_back_ios,
                                  size: 25.w, color: Colors.black),
                            ),
                            Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFFFF7D3F),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(Images.user1),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Color.fromARGB(255, 241, 239, 239),
                              child: InkWell(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: SvgPicture.asset(
                                  Images.settings,
                                  height: 25.h,
                                  width: 25.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Darrel Steward",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  SvgPicture.asset(
                                    Images.verified,
                                    color: Color(0xFFFF7D3F),
                                  ),
                                ],
                              ),
                              5.verticalSpace,
                              Text(
                                "darrelsteward@gmail.com",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 10.h),
                !widget.isSelf
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            function: () {},
                            label: "Follow",
                            isClicked: false,
                            isError: false,
                            backgroundColor: Color(0xFFFF7D3F),
                            icon: SvgPicture.asset(
                              Images.follow,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          CustomIconButton(
                            function: () {},
                            label: "Message",
                            isClicked: false,
                            isError: false,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            icon: SvgPicture.asset(
                              Images.messagesFilled,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: CustomIconButton(
                          function: () {
                            viewModel.createPost();
                          },
                          label: "Create Post",
                          isClicked: false,
                          isError: false,
                          backgroundColor: Color(0xFFFF7D3F),
                          icon: SvgPicture.asset(
                            Images.createPost,
                            color: Colors.white,
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StatCard(total: 9700, statName: "Followers"),
                        5.horizontalSpace,
                        StatCard(total: 13200, statName: "Likes"),
                        5.horizontalSpace,
                        StatCard(total: 92000, statName: "Views"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                    child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio:
                        2, // Adjust this ratio to achieve desired aspect ratio
                  ),
                  itemBuilder: (context, index) {
                    bool isEvenRow = (index ~/ 2) % 2 == 0;
                    double heightMultiplier = isEvenRow ? 2.0 : 1.0;

                    return InkWell(
                      onTap: () {
                        if (widget.isSelf) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (c) => PostDialog(
                              navigateToEdit: () => viewModel.editPost(
                                  dashboardItem: dashboardItemList[0]),
                              navigateToView: () => viewModel.viewPost(
                                  dashboardItem: dashboardItemList[0]),
                            ),
                          );
                        } else {
                          viewModel.viewPost(
                              dashboardItem: dashboardItemList[0]);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                                Images.photo3), // Use your image paths
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: MediaQuery.of(context).size.width *
                            0.5 *
                            heightMultiplier,
                        width: MediaQuery.of(context).size.width *
                            0.5, // Adjust width as needed
                      ),
                    );
                  },
                  itemCount: 10, // Number of items you want to display
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
