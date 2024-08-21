import 'package:benmore/config/locator.dart';
import 'package:benmore/core/constants/app_strings.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../core/utils/hive_boxes.dart';

class StorageService with ListenableServiceMixin {
  final _hiveService = locator<HiveInterface>();

  bool get _isStringBoxOpen => _hiveService.isBoxOpen(HiveBox.stringBox);
  Box<String> get _stringBox => _hiveService.box<String>(HiveBox.stringBox);

  bool get _isBoolBoxOpen => _hiveService.isBoxOpen(HiveBox.boolBox);
  Box<bool> get _boolBox => _hiveService.box<bool>(HiveBox.boolBox);

  Future<void> init() async {
    if (!_isStringBoxOpen) {
      await _hiveService.openBox<String>(HiveBox.stringBox);
    }
    if (!_isBoolBoxOpen) {
      await _hiveService.openBox<String>(HiveBox.boolBox);
    }
  }

  void addString(String key, String value) {
    _stringBox.put(key, value);
    notifyListeners();
  }

  void clearStringBox() {
    _stringBox.clear();
    notifyListeners();
  }

  void clearBoolBox() {
    _boolBox.clear();
    notifyListeners();
  }

  void Logout() async {
    _stringBox.deleteAll([AppStrings.token, AppStrings.refreshToken]);
  }

  void removeKey(String key) {
    _stringBox.delete(key);
    notifyListeners();
  }

  void addBool(String key, bool value) {
    _boolBox.put(key, value);
    notifyListeners();
  }

  bool? getBool(String key) {
    return _boolBox.get(key);
  }

  String? getString(String key) {
    return _stringBox.get(key);
  }

  void removeBool(String key) {
    _boolBox.delete(key);
    notifyListeners();
  }
}
