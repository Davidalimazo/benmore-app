import 'package:benmore/core/constants/formatted_strings.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/ui/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.navigate();
    });
  }

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.splashBg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Color.fromARGB(145, 3, 3, 3), BlendMode.darken)
          ),
        ),
        child: Center(
            child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.appLogo,
                width: isTablet ? 83.w : 63.w, height: isTablet ? 83.h : 63.w, color: Colors.white,),
            10.verticalSpace,
            Text(Strings.introTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            20.verticalSpace,
            Text(Strings.introSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Text(Strings.introSalutation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        )),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();
}
