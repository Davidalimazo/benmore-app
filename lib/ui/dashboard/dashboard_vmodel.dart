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

class DashboardVmodel extends ReactiveViewModel {
  final UserService _userService = locator<UserService>();

  final StorageService _storageService = locator<StorageService>();
  final DeviceInfoService _deviceInfoService = locator<DeviceInfoService>();
  final AuthRemoteDataSource _authRemoteDataSource =
      locator<AuthRemoteDataSource>();
  final FirebaseRemoteConfigService _remoteConfigService =
      locator<FirebaseRemoteConfigService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void navigateBack() => _navigationService.back();
  void navigateToProfile({required String userId, required bool isSelf}) =>
      _navigationService.navigateTo(Routes.profile,
          arguments: {"userId": userId, "isSelf": isSelf});

  void navigateToView(String route) {
    if (route == Routes.logInView) {
      _navigationService
          .navigateTo(Routes.logInView, arguments: {"isChecked": false});
    } else {
      _navigationService.navigateTo(route);
    }
  }

  void navigateToSelectId(String route, Map<String, dynamic> arguments) {
    _navigationService.navigateTo(route, arguments: arguments);
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_userService, _storageService];
}
