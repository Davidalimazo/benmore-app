// ignore_for_file: unused_element

import 'dart:async';

import 'package:benmore/config/locator.dart';
import 'package:benmore/config/router.dart';
import 'package:benmore/core/constants/app_strings.dart';
import 'package:benmore/core/constants/config.dart';
import 'package:benmore/core/constants/setup_dialog.dart';
import 'package:benmore/core/utils/logger.dart';
import 'package:benmore/core/utils/utils.dart';
import 'package:benmore/firebase_remote_config_service.dart';
import 'package:benmore/managers/lifecycle_manager.dart';
import 'package:benmore/ui/splash/splash_view.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'firebase_options.dart';
import 'package:benmore/styles/theme/theme.dart' as theme;

final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

Future<void> _reportError(dynamic error, dynamic stackTrace) async {
  // Print the exception to the console.
  print('Caught error: $error');
  if (isInDebugMode) {
    // Print the full stacktrace in debug mode.
    print(stackTrace);
  } else {
    // Send the Exception and Stacktrace to Crashlytics in Production mode.
    _crashlytics.recordError(error, stackTrace, fatal: true);
  }
}

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(Utils.lightdarkNav);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseRemoteConfigService().init();

  _crashlytics.setCrashlyticsCollectionEnabled(true);

  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      // In development mode simply print to console.
      FlutterError.dumpErrorToConsole(details);
    } else {
      // In production mode report to the application zone to report to Firebase Crashlytics
      FlutterError.onError = _crashlytics.recordFlutterError;
    }
  };

  await Config.loadEnv();
  setupLogger(firebaseClient: _crashlytics);
  await setupLocator();
  setupDialog();

  cameras = await availableCameras();
  await ThemeManager.initialise();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //A flutter plugin for adapting screen and font size.
    //Let your UI display a reasonable layout on different screen sizes!
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      builder: (c, _) => LifeCycleManager(
        child: ThemeBuilder(
          lightTheme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          defaultThemeMode: ThemeMode.light,
          builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
            title: AppStrings.appName,
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routers().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            home: SplashView(),
            navigatorObservers: [StackedService.routeObserver],
          ),
        ),
      ),
    );
  }
}
