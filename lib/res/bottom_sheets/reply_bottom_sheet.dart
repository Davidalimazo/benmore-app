import 'package:auto_size_text/auto_size_text.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/res/common/input/text_input.dart';
import 'package:benmore/res/components/buttons/custom_button.dart';
import 'package:benmore/ui/dashboard/dashboard_vmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
import '../components/util_widgets.dart';

Future replyCommentSheet({
  required BuildContext context,
}) async {
  double min = .45;
  double max = .5;
  showCustomBottomSheet(
      context: context,
      showCloseIcon: false,
      backgroundColor: Color(0xFFF2F4FA),
      initialChildSize: min > 1 ? 1 : min,
      minChildSize: min > 1 ? 1 : min,
      maxChildSize: max > 1 ? 1 : max,
      builder: (c, s) => ReplyCommentSheet(
            scrollController: s,
          ));
}

class ReplyCommentSheet extends StatefulWidget {
  final ScrollController scrollController;

  const ReplyCommentSheet({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ReplyCommentSheet> createState() => _ReplyCommentSheetState();
}

class _ReplyCommentSheetState extends State<ReplyCommentSheet> {
  GlobalKey<FormState> _replyformKey = GlobalKey<FormState>();
  TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardVmodel>.reactive(
      viewModelBuilder: () => DashboardVmodel(),
      builder: (context, viewModel, child) => Padding(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 22.w),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reply User',
                    style: BrandTextStyles.bold
                        .copyWith(fontSize: 18.sp, color: BrandColors.bc1C1939),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(Images.close,
                        width: 25.w, height: 25.h),
                  )
                ],
              ),
              SizedBox(height: 28.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  controller: widget.scrollController,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Form(
                      key: _replyformKey,
                      child: Column(
                        children: [
                          5.verticalSpace,
                          AutoSizeText("Enter Comment",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500)),
                          5.verticalSpace,
                          textAreaInput(
                            context: context,
                            label: "Enter Comment",
                            controller: replyController,
                            maxLines: 2,
                            type: TextInputType.name,
                            maxLength: 50,
                            formatter: false,
                            hint: 'Enter Comment',
                            validate: (val) {
                              if (val.isEmpty) {
                                return "⛔ Invalid Comment";
                              }
                              return null;
                            },
                          ),
                          15.verticalSpace,
                          Center(
                            child: CustomButton(
                                onTap: () async {
                                  if (_replyformKey.currentState!.validate()) {
                                    // viewModel.isError = true;
                                    setState(() {});
                                    Navigator.pop(context);
                                    //   await viewModel.login();
                                  } else {
                                    setState(() {});
                                    // viewModel.isError = false;
                                  }
                                  setState(() {});
                                },
                                title: "Reply",
                                isClicked: false,
                                disable: replyController.text.isEmpty),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
