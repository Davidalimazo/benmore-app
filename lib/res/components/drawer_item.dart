import 'package:benmore/res/components/util_widgets.dart';
import 'package:benmore/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DrawerItems extends StatefulWidget {
  final int index;
  final String icon;
  final String title;
  final int isCurrentIndex;
  final VoidCallback setCurrentIndex;

  DrawerItems({Key? key, required this.setCurrentIndex, required this.isCurrentIndex, required this.index, required this.title, required this.icon}) : super(key: key);

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {


  @override
  Widget build(BuildContext context) {
      bool isTablet = MediaQuery.of(context).size.width >= 600;
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: widget.isCurrentIndex == widget.index ? Colors.grey.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: widget.setCurrentIndex,
        leading: Container(
          width: isTablet ? 80.w : 50.w,
          height:isTablet ? 150.h : 100.h,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.isCurrentIndex == widget.index  ? Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width:isTablet ? 20.w :  10.w,
                height:isTablet ? 150.h : 100.h,
                decoration: BoxDecoration(
                    color: BrandColors.primary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r))),
              ) : const SizedBox.shrink(),
              widget.isCurrentIndex == widget.index  ? SizedBox(width: 10.w) : SizedBox(width: 20.w),
              SvgPicture.asset(widget.icon, width:isTablet ? 32.w : 16.w, height: isTablet ? 32.h : 16.h)
            ],
          ),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
              color:
              widget.isCurrentIndex == widget.index  ? BrandColors.primary : Colors.black,
              fontSize: isTablet ? 22.sp : 11.sp,
              fontWeight: FontWeight.w600),
        ),
        hoverColor: Colors.grey.withOpacity(0.1),
      ),
    );
  }
}
