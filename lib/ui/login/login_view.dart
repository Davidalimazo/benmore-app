import 'package:benmore/core/constants/app_strings.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/res/common/disable_backbtn/disable_backbtn_view.dart';
import 'package:benmore/res/common/input/text_input.dart';
import 'package:benmore/res/components/buttons/custom_button.dart';
import 'package:benmore/styles/colors.dart';
import 'package:benmore/ui/login/login_viewmodel.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  final bool isChecked;
  const LoginView({super.key, this.isChecked = false});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> _signInformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (model) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            model.addListener(model.checkCharacterCount);
            model.loadInitialValueFromHive();
          });
        },
        builder: (context, viewModel, child) => DisableBackButton(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  systemOverlayStyle: Utils.dark,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 0.0,
                ),
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Center(
                          child: SvgPicture.asset(Images.appLogo,
                              height: 62.h, width: 62.w),
                        ),
                        20.verticalSpace,
                        Center(
                            child: Column(
                          children: [
                            AutoSizeText("Welcome Back",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600)),
                            5.verticalSpace,
                            AutoSizeText("Enter your credentials to login",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )),
                        40.verticalSpace,
                        Form(
                            key: _signInformKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText("Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: AppStrings.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400)),
                                5.verticalSpace,
                                emailInput(
                                  context: context,
                                  focusNode: viewModel.focus,
                                  label: "Enter email",
                                  controller: viewModel.usernameController,
                                  hint: 'Enter email',
                                  validate: (val) {
                                    if (!Utils.isEmail(val)) {
                                      return "⛔ Invalid email";
                                    }
                                    return null;
                                  },
                                ),
                                10.verticalSpace,
                                AutoSizeText("Password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: AppStrings.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400)),
                                5.verticalSpace,
                                passwordInput(
                                  context: context,
                                  focusNode: viewModel.passwordFocusNode,
                                  label: "Enter password",
                                  controller: viewModel.passwordController,
                                  type: TextInputType.name,
                                  obscureText: viewModel.obscurePassword,
                                  onHideText: () => setState(() {
                                    viewModel.obscurePassword =
                                        !viewModel.obscurePassword;
                                  }),
                                  maxLength: 30,
                                  formatter: true,
                                  hint: 'Enter password',
                                  validate: (val) {
                                    if (val.isEmpty) {
                                      return "⛔ Invalid password";
                                    }
                                    return null;
                                  },
                                ),
                                20.verticalSpace,
                                Center(
                                  child: CustomButton(
                                      onTap: () async {
                                        if (_signInformKey.currentState!
                                            .validate()) {
                                          viewModel.isError = true;
                                          setState(() {});
                                          await viewModel.login();
                                        } else {
                                          setState(() {});
                                          viewModel.isError = false;
                                        }
                                        setState(() {});
                                      },
                                      title: viewModel.buttonState,
                                      isClicked: viewModel.isClicked,
                                      disable: !Utils.isEmail(viewModel
                                              .usernameController.text) ||
                                          viewModel.passwordController.text
                                                  .length <
                                              5),
                                ),
                                20.verticalSpace,
                                InkWell(
                                  onTap: () {
                                    viewModel.createAccount();
                                  },
                                  child: Center(
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: BrandColors.grey,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12.sp),
                                            children: const [
                                          TextSpan(
                                            text: "Don't have an account? ",
                                          ),
                                          TextSpan(
                                            style: TextStyle(
                                                color: BrandColors.primary,
                                                fontWeight: FontWeight.w600),
                                            text: "Sign up",
                                          )
                                        ])),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
