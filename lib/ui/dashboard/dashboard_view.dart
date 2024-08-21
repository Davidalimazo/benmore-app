import 'package:benmore/core/utils/dashboard_data.dart';
import 'package:benmore/res/components/reaction.dart';
import 'package:benmore/res/components/util_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/res/common/disable_backbtn/disable_backbtn_view.dart';
import 'package:benmore/res/components/dashboard_card.dart';
import 'package:benmore/ui/dashboard/dashboard_vmodel.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DashboardVmodel(),
      onViewModelReady: (model) {
        // Optional: Perform any additional setup
      },
      builder: (context, viewModel, child) => DisableBackButton(
        child: Scaffold(
          backgroundColor: Color(0xFFF1F3F6),
          body: SafeArea(
            child: Column(
              children: [
                // Header Container
                appHeader(
                    context: context,
                    isVerified: true,
                    navigator: () => viewModel.navigateToProfile(
                        userId: 'hyudjhj', isSelf: true),
                    userImage: Images.user1),
                SizedBox(height: 30.h),
                // PageView for swiping between different dashboard cards and reaction cards
                Expanded(
                  child: PageView.builder(
                    itemCount: dashboardItemList.length,
                    itemBuilder: (context, index) {
                      final item = dashboardItemList[index];
                      return ListView(
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
                                      dashboardItem: item,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
