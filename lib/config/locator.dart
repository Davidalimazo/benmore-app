import 'dart:io';

import 'package:benmore/core/utils/logger.dart';
import 'package:benmore/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:benmore/data_source/auth_remote_data_source/auth_remote_data_source_impl.dart';
import 'package:benmore/data_source/utilities/utilities_remote_datasource.dart';
import 'package:benmore/data_source/utilities/utilities_remote_datasource_impl.dart';
import 'package:benmore/firebase_remote_config_service.dart';
import 'package:benmore/services/post_service.dart';
import 'package:benmore/services/device_info_service.dart';
import 'package:benmore/services/http/http_service.dart';
import 'package:benmore/services/http/http_service_impl.dart';
import 'package:benmore/services/storage_service.dart';
import 'package:benmore/services/user_service.dart';
import 'package:benmore/services/utility_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false}) async {
  final Directory appDocDir =
      test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  if (!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
  }

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  locator.registerLazySingleton<UtilRemoteDataSource>(
      () => UtilRemoteDataSourceImpl());

  locator.registerLazySingleton<DeviceInfoService>(
      () => DeviceInfoService()..initDeviceInfo());

  // locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<UtilityService>(() => UtilityService());
  locator.registerLazySingleton<UserService>(() => UserService());

  locator.registerLazySingleton<PostService>(() => PostService());

  locator.registerLazySingleton<FirebaseRemoteConfigService>(
      () => FirebaseRemoteConfigService()..init());

  Logger.d('Initializing boxes...');
  await StorageService().init();
  await UserService().init();
  await locator<PostService>().init();
}
