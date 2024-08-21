import 'package:benmore/config/locator.dart';
import 'package:benmore/services/storage_service.dart';
import 'package:benmore/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DisableBackBtnVmodel extends ReactiveViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final StorageService _storageService = locator<StorageService>();

  Future<void> clearData() async {
    _userService.clear();
    _storageService.Logout();
  }
}
