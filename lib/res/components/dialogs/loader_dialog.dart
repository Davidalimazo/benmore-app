

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../styles/text_styles.dart';
import '../animation/loading_animation.dart';

class LoaderDialog extends StatefulWidget {
  final DialogRequest request;

  const LoaderDialog({Key? key, required this.request}) : super(key: key);

  @override
  _LoaderDialogState createState() => _LoaderDialogState();
}

class _LoaderDialogState extends State<LoaderDialog> with SingleTickerProviderStateMixin  {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.5).animate(curve);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
      controller.reverse();
      else if(status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140.h,
                child: LoadingAnimation()
              ),
              SizedBox(height: 5.h),
              widget.request.title != null
                ? Text(
                    widget.request.title!,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: BrandTextStyles.bold.copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                      // fontFamily: 'Roboto'
                    ),
                  )
                : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}