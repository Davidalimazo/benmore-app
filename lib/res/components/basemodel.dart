import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/app_routes.dart';
import 'package:benmore/services/storage_service.dart';
import 'package:benmore/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseVmodel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final StorageService _storageService = locator<StorageService>();

  void clearUserData() {
    _userService.clear();
    _storageService.Logout();
  }

  void navigateBack() => _navigationService.back();

  void navigateToView(String route) {
    if (route == Routes.logInView) {
      _navigationService
          .navigateTo(Routes.logInView, arguments: {"isChecked": false});
    } else {
      _navigationService.navigateTo(route);
    }
  }


  void navigateToLogin() => _navigationService
      .navigateTo(Routes.logInView, arguments: {"isChecked": true});

  void navigateToLoginFromDrawer() => _navigationService
      .navigateTo(Routes.logInView, arguments: {"isChecked": false});

}
