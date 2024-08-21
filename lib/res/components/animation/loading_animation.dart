

import 'package:benmore/core/constants/static_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supercharged/supercharged.dart';

class LoadingAnimation extends StatefulWidget {
  final double? height;

  const LoadingAnimation({Key? key,this.height}) : super(key: key);

  @override
  LoadingAnimationState createState() => LoadingAnimationState();
}

class LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin  {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: 1500.milliseconds, vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.5).animate(curve);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
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
    return Material(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: widget.height,
          child: FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: Image.asset(
                Images.appLogo,
                height: 80.h,
              )
            ),
          ),
        ),
      ),
    );
  }
}