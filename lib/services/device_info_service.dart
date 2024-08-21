import 'dart:io';

import 'package:benmore/core/utils/logger.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:stacked/stacked.dart';

class DeviceInfoService with ListenableServiceMixin {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  IosDeviceInfo? iosInfo;
  AndroidDeviceInfo? androidInfo;

  String? _name;
  String? get name => _name;

  String? _id;
  String? get id => _id;

  String? _version;
  String? get version => _version;

  String? _code;
  String? get code => _code;

  String? _deviceType;
  String? get deviceType => _deviceType;

  double? _latitude;
  double? get latitude => _latitude;

  double? _longitude;
  double? get longitude => _longitude;

  String? _ip;
  String? get ip => _ip;

  DeviceInfoService() {
    listenToReactiveValues(
        [iosInfo, androidInfo, _name, _version, _code, _deviceType, _ip]);
  }

  Future initDeviceInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _ip = await NetworkInfo().getWifiIP();

    // Location location = Location();
    // final loc = await location.getLocation();
    // if (await canGetLocation(location)) {
    //   _latitude = loc.latitude;
    //   _longitude = loc.longitude;
    // }

    if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
      _name = iosInfo?.name ?? iosInfo?.model ?? iosInfo?.localizedModel ?? '';
      _id = iosInfo!.identifierForVendor;
      _deviceType = '${iosInfo!.name} ${iosInfo!.model}';
    } else {
      androidInfo = await deviceInfo.androidInfo;
      _name = androidInfo?.model ??
          androidInfo?.device ??
          androidInfo?.product ??
          '';
      _id = androidInfo!.id;
      // final PermissionStatus permissionStatus = await _getPhonePermission();
      // print(permissionStatus);
      // if(permissionStatus == PermissionStatus.granted) {
      //   print(androidInfo!.androidId);
      //   print(await UniqueIdentifier.serial);
      //   print(await DeviceInformation.);
      // }
      _deviceType =
          '${androidInfo!.device} ${androidInfo!.model} ${androidInfo?.product ?? ''}';
      notifyListeners();
    }
    Logger.d('APP VERSION: ${packageInfo.version}');
    Logger.d('DEVICE ID: $_id');

    _version = packageInfo.version;
    _code = packageInfo.buildNumber;
    notifyListeners();
  }
}
