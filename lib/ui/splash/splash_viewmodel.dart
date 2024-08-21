import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/app_routes.dart';
import 'package:benmore/core/utils/hive_box_keys.dart';
import 'package:benmore/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends ReactiveViewModel {
  StorageService _storageService = locator<StorageService>();
  NavigationService _navigationService = locator<NavigationService>();
  Uuid _uuid = Uuid();

  navigate() {
    String? deviceId = _storageService.getString(HiveBoxKeys.deviceId);
    if (deviceId == null) {
      _storageService.addString(HiveBoxKeys.deviceId, _uuid.v4());
    }
    Future.delayed(
      const Duration(seconds: 5),
      () {
        _navigationService
            .navigateTo(Routes.logInView, arguments: {"isChecked": false});
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_storageService];
}
