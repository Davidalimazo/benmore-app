import 'package:benmore/config/locator.dart';
import 'package:benmore/core/enums/type_ids.dart';
import 'package:benmore/core/utils/hive_box_keys.dart';
import 'package:benmore/core/utils/hive_boxes.dart';
import 'package:benmore/models/post/post.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

/// A user service class to store states that is needed across multiple ViewModels
class PostService with ListenableServiceMixin {
  List<Post> _posts = []; // Initialize _posts as an empty list
  List<Post> get posts => _posts;

  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.postBox);
  Box<List> get _postBox => _hiveService.box<List>(HiveBox.postBox);

  PostService() {
    listenToReactiveValues([_posts]);
  }

  Future<void> init() async {
    if (!_hiveService.isAdapterRegistered(TypeId.post)) {
      _hiveService.registerAdapter(PostAdapter());
    }

    if (!_isBoxOpen) {
      await _hiveService.openBox<List>(HiveBox.postBox);
    }
    getBanks();
  }

  void getBanks() {
    List<dynamic> posts =
        _postBox.get(HiveBoxKeys.post, defaultValue: []) ?? [];

    if (posts.isNotEmpty) {
      _posts = posts
          .map((pst) => Post(
              assigned_to: pst?.assigned_to,
              comments: pst?.comments,
              description: pst?.description,
              created_at: pst?.created_at,
              image_url: pst?.image_url,
              likes: pst?.likes,
              status: pst?.status))
          .toList();
      notifyListeners();
    }
  }

  Future<void> addBank(List<Post> receivedBanks) async {
    await _postBox.put(HiveBoxKeys.post, receivedBanks);

    if (receivedBanks.isNotEmpty) {
      _posts.addAll(receivedBanks);
      notifyListeners();
    }
  }

  Future<void> clearBox() async {
    await _postBox.clear();
    _posts = [];
    notifyListeners();
  }

  void clearBanks() {
    _posts = [];
    notifyListeners();
  }
}
