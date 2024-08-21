import 'package:benmore/config/locator.dart';
import 'package:benmore/core/enums/type_ids.dart';
import 'package:benmore/core/utils/hive_boxes.dart';
import 'package:benmore/core/utils/logger.dart';
import 'package:benmore/core/utils/store_id.dart';
import 'package:hive/hive.dart';


import 'package:stacked/stacked.dart';

import '../models/user/user.dart';

/// A user service class to store states that is needed across multiple ViewModels
class UserService with ListenableServiceMixin {
  User? _user;
  User? get user => _user;

  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.userBox);
  Box<User> get userBox =>
      _hiveService.box<User>(HiveBox.userBox);

  UserService() {
    listenToReactiveValues([_user]);
  }

  Future<void> init() async {
    if (!_hiveService.isAdapterRegistered(TypeId.user)) {
      _hiveService.registerAdapter(UserAdapter());
    }

    if (!_isBoxOpen) {
      await _hiveService.openBox<User>(HiveBox.userBox);
    }
  }

  Future addUser(User user) async {
    print('Adding ${user.first_name}');
    getPensioner();
    await userBox.put(0, user);
    getPensioner();
    _user = user;
    notifyListeners();
  }

  void getPensioner() {
    _user = userBox.get(0);
    notifyListeners();
  }

  Future clear() async {
    print('CLEEEEARR');
    await userBox.clear();
    _user = null;
    notifyListeners();
    getPensioner();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  Future clearPensionerBox() async {
    Logger.d('CLEEEEARRED');
    await userBox.clear();
    notifyListeners();
    getPensioner();
  }

  Future deleteAll() async {
    userBox.deleteAll([
      StoreId.updateDetailsData,
      StoreId.persistedData
    ]);
  }

  void clearPensioner() {
    _user = null;
    notifyListeners();
  }
}
