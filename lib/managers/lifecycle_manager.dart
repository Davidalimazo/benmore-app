import 'dart:async';
import 'package:benmore/config/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;

  const LifeCycleManager({Key? key, required this.child}) : super(key: key);

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  final NavigationService _navigationService = locator<NavigationService>();
  // final AuthRemoteDataSource _authRemoteDataSource =
  //     locator<AuthRemoteDataSource>();
  // final UserService _userService = locator<UserService>();
  // final UtilityService _utilityService = locator<UtilityService>();
  // final AuthService _authService = locator<AuthService>();
  // final StorageService _storageService = locator<StorageService>();

  //    _authService.authenticationResponse;

  //User? get user => _userService.user;
  static const String env = String.fromEnvironment('app.env');
  bool isProduction = kReleaseMode;

  static const _inactivityTimeout = Duration(minutes: env == 'dev' ? 10 : 2);
  Timer? _keepAliveTimer;
  int min = 8;
  Timer? _timer;

  void _keepAlive(bool visible) {
    if (isProduction) {
      _keepAliveTimer?.cancel();
      if (visible) {
        _keepAliveTimer = null;
      } else {
        _keepAliveTimer = Timer(_inactivityTimeout, () {
          print('timeout');
          // _userService.clearUser();
        });
      }
    }
  }

  @override
  void initState() {
    _keepAlive(false);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _keepAlive(false),
        onPanDown: (_) => _keepAlive(false),
        child: widget.child);
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _keepAlive(false);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        _keepAlive(false);
        _timer?.cancel();
        break;
    }
  }
}
