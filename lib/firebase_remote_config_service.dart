import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

//This class is used to determine the current app version
//and to decide if the particular build is still valid.
class FirebaseRemoteConfigService {
  final firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    try {
      await firebaseRemoteConfig.ensureInitialized();
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );

      // These will be used before the values are fetched from Firebase Remote Config.
      await firebaseRemoteConfig.setDefaults(const {
        'appVersion': '1.0.0',
      });

      // Fetch the values from Firebase Remote Config
      await firebaseRemoteConfig.fetchAndActivate();

      // Optional: listen for and activate changes to the Firebase Remote Config values
      firebaseRemoteConfig.onConfigUpdated.listen((event) async {
        await firebaseRemoteConfig.activate();
      });
    } on FirebaseException catch (e, st) {
      developer.log(
        'Unable to initialize Firebase Remote Config',
        error: e,
        stackTrace: st,
      );
    }
  }

  // Helper methods to simplify using the values in other parts of the code
  // String getAndroidAppRequiredVersion() =>
  //     firebaseRemoteConfig.getString('androidAppVersion');

  // String getIOSAppRequiredVersion() =>
  //     firebaseRemoteConfig.getString('iosAppVersion');
}
