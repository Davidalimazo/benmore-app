// import 'package:charts_flutter/flutter.dart' as charts;


import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';


class UtilityService with ListenableServiceMixin {

  bool _serviceRequestsLoading = true;
  bool get serviceRequestsLoading => _serviceRequestsLoading;

  bool _signedIn = false;
  bool get signedIn => _signedIn;

  bool _showNav = false;
  bool get showNav => _showNav;

  Uint8List? _pdfContent;
  Uint8List? get pdfContent => _pdfContent;

  bool _autoShowBiometrics = true;
  bool get autoShowBiometrics => _autoShowBiometrics;
  set autoShowBiometrics(bool val) {
    _autoShowBiometrics = val;
    notifyListeners();
  }

  List existingLabels = <String>[];

  int index = 0;

  UtilityService() {
    listenToReactiveValues([
      _serviceRequestsLoading,
      _signedIn,
      _showNav,
      index
    ]);
  }

  void setIndex(int val) {
    index = val;
    notifyListeners();
  }

  void setSignedIn(bool val) {
    _signedIn = val;
    notifyListeners();
  }

  void setShowNav(bool val) {
    _showNav = val;
    notifyListeners();
  }

}
