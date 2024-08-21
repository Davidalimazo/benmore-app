import 'package:benmore/core/utils/dashboard_data.dart';
import 'package:benmore/res/components/reaction.dart';
import 'package:benmore/res/components/util_widgets.dart';
import 'package:benmore/ui/view_post/view_post_vmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/res/common/disable_backbtn/disable_backbtn_view.dart';
import 'package:benmore/res/components/dashboard_card.dart';
import 'package:stacked/stacked.dart';

class ViewPostView extends StatefulWidget {
  final DashboardItem dashboardItem;
  const ViewPostView({super.key, required this.dashboardItem});

  @override
  State<ViewPostView> createState() => _ViewPostViewState();
}

class _ViewPostViewState extends State<ViewPostView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewPostViewModel(),
      onViewModelReady: (model) {
        // Optional: Perform any additional setup
      },
      builder: (context, viewModel, child) => DisableBackButton(
        child: Scaffold(
          backgroundColor: Color(0xFFF1F3F6),
          appBar: AppBar(
            elevation: 0.0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25.w,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                // Header Containerprofi
                appHeader(
                    context: context,
                    isVerified: true,
                    navigator: () => viewModel.navigateToProfile(
                        userId: 'hyudjhj', isSelf: true),
                    userImage: Images.user1),
                SizedBox(height: 30.h),
                // PageView for swiping between different dashboard cards and reaction cards
                Expanded(
                    child: ListView(
                  children: [
                    // Horizontal ListView
                    Container(
                      height: MediaQuery.of(context).size.height * 0.42,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1, // One item per page
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              //  bannerSkeleton(context: context),
                              DashboardCard(
                                dashboardItem: widget.dashboardItem,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Reaction Card
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      child: Column(
                        children: [
                          // reactionSkeleton(
                          //     context: context, count: [1, 2, 3])
                          ...reactionItems.map((reaction) => Reaction(
                                reactionItem: reaction,
                              )),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
