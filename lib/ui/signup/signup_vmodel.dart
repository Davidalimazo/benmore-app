import 'dart:io';

import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/app_routes.dart';
import 'package:benmore/core/constants/app_strings.dart';
import 'package:benmore/core/enums/dialog_type.dart';
import 'package:benmore/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:benmore/firebase_remote_config_service.dart';
import 'package:benmore/res/components/flusher.dart';
import 'package:benmore/services/device_info_service.dart';
import 'package:benmore/services/storage_service.dart';
import 'package:benmore/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends ReactiveViewModel {
  bool _obscurePassword = true;
  bool _isClicked = false;
  bool _isError = true;
  bool _isSubmitting = false;
  String _buttonState = "Proceed";
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final UserService _userService = locator<UserService>();

  final StorageService _storageService = locator<StorageService>();
  final DeviceInfoService _deviceInfoService = locator<DeviceInfoService>();
  final AuthRemoteDataSource _authRemoteDataSource =
      locator<AuthRemoteDataSource>();
  final FirebaseRemoteConfigService _remoteConfigService =
      locator<FirebaseRemoteConfigService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool get obscurePassword => _obscurePassword;
  bool get isClicked => _isClicked;
  bool get isError => _isError;
  bool get isSubmitting => _isSubmitting;
  String get buttonState => _buttonState;
  set obscurePassword(bool val) => _obscurePassword = val;

  set isError(bool val) => _isError = val;

  void checkCharacterCount() {
    if (usernameController.text.length > 15) {
      // If the character count reaches 10, lose focus
      if (Platform.isAndroid) {
        passwordFocusNode.unfocus();
      }
      _isError = false;
    }
  }

  Future<void> loadInitialValueFromHive() async {
    usernameController.text =
        _storageService.getString(AppStrings.userEmail) ?? "";
    notifyListeners();
  }

  void navigateToLogin() => _navigationService
      .navigateTo(Routes.logInView, arguments: {"isChecked": false});

  Future<void> login() async {
    _isSubmitting = true;
    _isClicked = true;
    // _dialogService.showCustomDialog(
    //   variant: DialogType.loader,
    //   barrierColor: Colors.black.withOpacity(0.5),
    //   title: 'Please wait...',
    // );
    // final response = await _authRemoteDataSource.login(
    //     username: usernameController.text.trim(), password: passwordController.text.trim());

    // response.fold((l) {
    //   _isSubmitting = false;
    //   _isSuccess = false;
    //   _isClicked = false;
    //   _dialogService.completeDialog(DialogResponse());
    //   flusher(l.message, color: Colors.red);
    //   notifyListeners();
    // }, (r) {
    //   _userService.addUser(r.user);
    //   _storageService.addString(AppStrings.token, r.token);
    //   _storageService.addString(AppStrings.refreshToken, r.refreshToken);
    //   _isSubmitting = false;
    //   _isSuccess = true;
    //   _isClicked = false;
    //   notifyListeners();
    //   _dialogService.completeDialog(DialogResponse());
    //   _navigationService.navigateTo(Routes.userHomeScreen);
    // });
    _navigationService.navigateTo(Routes.dashboard);
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_userService, _storageService];
}
