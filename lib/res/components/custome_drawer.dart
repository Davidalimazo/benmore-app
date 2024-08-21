import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/models/drawer_model.dart';
import 'package:benmore/res/components/basemodel.dart';
import 'package:benmore/res/components/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class CustomDrawer extends StatefulWidget {
  final bool isFinalStep;
  CustomDrawer({Key? key, required this.isFinalStep}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int isDrawerCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;
    List<DrawerModel> list = widget.isFinalStep ? drawerListFinal : drawerList;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => BaseVmodel(),
        builder: (context, viewModel, child) => Drawer(
              backgroundColor: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text(""),
                    accountEmail: Text(""),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          Images.user1,
                          fit: BoxFit.cover,
                          height: isTablet ? 150.h : 100.h,
                          width: isTablet ? 150.w : 100.w,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  Column(children: [
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DrawerItems(
                              isCurrentIndex: isDrawerCurrentIndex,
                              setCurrentIndex: () async {
                                setState(() {
                                  isDrawerCurrentIndex = index;
                                });
                                if (list[index].title != "Log Out") {
                                  viewModel.navigateToView(list[index].screen);
                                } else {
                                  viewModel.clearUserData();
                                  viewModel.navigateToLoginFromDrawer();
                                }
                              },
                              index: index,
                              title: list[index].title,
                              icon: list[index].icon);
                        }),
                    const SizedBox(height: 40),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Text(
                            "App Version - V1.0",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: isTablet ? 24 : 12),
                          ),
                        ))
                  ])
                ],
              ),
            ));
  }
}
