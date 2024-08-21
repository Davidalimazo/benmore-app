import 'dart:io';

import 'package:benmore/core/constants/app_strings.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/res/common/disable_backbtn/disable_backbtn_view.dart';
import 'package:benmore/res/common/input/text_input.dart';
import 'package:benmore/res/components/buttons/custom_button.dart';
import 'package:benmore/res/components/dialogs/success_dialog.dart';
import 'package:benmore/res/components/flusher.dart';
import 'package:benmore/ui/signup/signup_vmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class EditProfileView extends StatefulWidget {
  final bool isChecked;
  const EditProfileView({super.key, this.isChecked = false});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  GlobalKey<FormState> _signupformKey = GlobalKey<FormState>();

  File? image;
  Future captureImage() async {
    try {
      final imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile == null) return null;
      final temp = File.fromUri(Uri.parse(imageFile.path));
      setState(() {
        this.image = temp;
      });
    } on PlatformException catch (e) {
      print("failed to launch camera: ${e.message}");
      flusher("An Error Occurred", color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        onViewModelReady: (model) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            model.addListener(model.checkCharacterCount);
          });
        },
        builder: (context, viewModel, child) => DisableBackButton(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  systemOverlayStyle: Utils.dark,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: true,
                  centerTitle: true,
                  title: SvgPicture.asset(Images.appLogo,
                      height: 52.h, width: 52.w),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
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
                            child: Column(
                          children: [
                            AutoSizeText("Edit Profile",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600)),
                            5.verticalSpace,
                            AutoSizeText("Edit your credentials below",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )),
                        40.verticalSpace,
                        Form(
                            key: _signupformKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText("Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: AppStrings.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400)),
                                5.verticalSpace,
                                textInput(
                                  context: context,
                                  label: "Enter name",
                                  controller: viewModel.name,
                                  type: TextInputType.name,
                                  maxLength: 15,
                                  formatter: false,
                                  hint: 'Enter name',
                                  validate: (val) {
                                    if (val.isEmpty) {
                                      return "⛔ Invalid username";
                                    }
                                    return null;
                                  },
                                ),
                                10.verticalSpace,
                                AutoSizeText("Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: AppStrings.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400)),
                                5.verticalSpace,
                                emailInput(
                                  context: context,
                                  focusNode: viewModel.emailFocus,
                                  label: "Enter email",
                                  enable: false,
                                  controller: viewModel.emailController,
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
                                  label: "Enter password",
                                  controller: viewModel.password,
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
                                10.verticalSpace,
                                image == null
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8.0), // <-- Radius
                                          ),
                                          // Background color
                                        ),
                                        onPressed: () async {
                                          await captureImage();
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              size: isTablet ? 48 : 24,
                                            ),
                                            const SizedBox(width: 10),
                                            Text("Upload Profile Picture")
                                          ],
                                        ))
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: ClipOval(
                                              child: SizedBox(
                                                width:
                                                    200, // Width and height must be the same to ensure a circle
                                                height: 200,
                                                child: Image.file(
                                                  File.fromUri(Uri.parse(
                                                      image?.path ?? "")),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  image = null;
                                                });
                                              },
                                              child: Text("Delete"))
                                        ],
                                      ),
                                20.verticalSpace,
                                Center(
                                  child: CustomButton(
                                      onTap: () async {
                                        //  viewModel.isError = true;

                                        setState(() {});
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (c) => SuccessDialog(
                                            callback: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        );
                                        //   await viewModel.login();
                                      },
                                      title: "Edit Profile",
                                      isClicked: viewModel.isClicked,
                                      disable: image == null &&
                                          viewModel.name.text.isEmpty &&
                                          viewModel.password.text.isEmpty),
                                ),
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
