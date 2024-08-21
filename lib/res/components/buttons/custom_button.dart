import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../styles/colors.dart';
import '../../../styles/text_styles.dart';

class CustomButton extends StatefulWidget {
  final String? title;
  final Function onTap;
  final bool filled;
  final bool disable;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final EdgeInsets? padding;
  final double? radius;
  final double? height;
  final Widget? child;
  final bool showBorder;
  final bool isClicked;
  final TextStyle? textStyle;

  const CustomButton(
      {Key? key,
      this.title,
      this.isClicked = false,
      required this.onTap,
      this.filled = true,
      this.backgroundColor = BrandColors.primary,
      this.textColor,
      this.textSize,
      this.disable = false,
      this.padding,
      this.radius,
      this.height,
      this.child,
      this.showBorder = true,
      this.textStyle})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Material(
      borderRadius: BorderRadius.circular(widget.radius ?? 10.r),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (!widget.disable) {
            HapticFeedback.mediumImpact();
            widget.onTap();
          }
        },
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: widget.height != null
              ? EdgeInsets.zero
              : widget.padding ??
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
              color: widget.disable
                  ? BrandColors.bc979797
                  : widget.filled
                      ? (widget.backgroundColor ?? BrandColors.primary)
                      : null,
              border: !widget.disable
                  ? widget.showBorder
                      ? Border.all(
                          color: widget.backgroundColor ?? Color(0xFF011B55))
                      : null
                  : Border.all(
                      color: widget.disable
                          ? Colors.transparent
                          : (widget.backgroundColor ?? Color(0xFF011B55))),
              borderRadius: BorderRadius.circular(widget.radius ?? 10.r)),
          child: Center(
            child: widget.child ??
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: widget.isClicked
                      ? SpinKitCircle(
                          color: Colors.white,
                          size: isTablet ? 48.0 : 24.0,
                        )
                      : Text(
                          '${widget.title}',
                          style: widget.textStyle ??
                              BrandTextStyles.semiBold.copyWith(
                                  fontSize: widget.textSize ?? 16.sp,
                                  color: widget.textColor ?? Colors.white,
                                  height: 1.875),
                          textAlign: TextAlign.center,
                        ),
                ),
          ),
        ),
      ),
    );
  }
}
