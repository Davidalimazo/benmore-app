import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/res/common/input/text_input.dart';
import 'package:benmore/res/components/buttons/custom_button.dart';
import 'package:benmore/res/components/buttons/custom_icon_button.dart';
import 'package:benmore/res/components/flusher.dart';
import 'package:benmore/res/components/util_widgets.dart';
import 'package:benmore/ui/edit_post/edit_post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:benmore/core/constants/static_images.dart';
import 'package:benmore/res/common/disable_backbtn/disable_backbtn_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  GlobalKey<FormState> _signupformKey = GlobalKey<FormState>();
  late TextEditingController captionController;
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
  void initState() {
    super.initState();
    captionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => EditPostViewModel(),
        onViewModelReady: (model) {},
        builder: (context, viewModel, child) => DisableBackButton(
              child: Scaffold(
                backgroundColor: Color(0xFFF1F3F6),
                appBar: AppBar(
                  systemOverlayStyle: Utils.dark,
                  backgroundColor: Color(0xFFF1F3F6),
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 25.w,
                    ),
                  ),
                  elevation: 0.0,
                ),
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        appHeader(
                            context: context,
                            isVerified: true,
                            navigator: () => viewModel.navigateToProfile(
                                userId: 'hyudjhj', isSelf: true),
                            userImage: Images.user1),
                        15.verticalSpace,
                        Center(
                            child: Column(
                          children: [
                            AutoSizeText("Create Post",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )),
                        40.verticalSpace,
                        Form(
                            key: _signupformKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText("Caption",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400)),
                                5.verticalSpace,
                                textAreaInput(
                                  context: context,
                                  label: "Edit Caption",
                                  //  initialValue: widget.dashboardItem.caption,
                                  controller: captionController,
                                  type: TextInputType.name,
                                  maxLength: 50,
                                  formatter: false,
                                  hint: 'Enter caption',
                                  validate: (val) {
                                    if (val.isEmpty) {
                                      return "⛔ Invalid caption";
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
                                            Text("Upload Image")
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
                                40.verticalSpace,
                                CustomButton(
                                  onTap: () {
                                    if (captionController.text.isNotEmpty &&
                                        image != null) {
                                      //edit function
                                    }
                                  },
                                  title: "Create Post",
                                  isClicked: false,
                                  disable: false,
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
