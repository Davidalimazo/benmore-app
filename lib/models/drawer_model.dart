import 'package:benmore/core/constants/app_routes.dart';
import 'package:benmore/core/constants/static_images.dart';

class DrawerModel {
  String icon;
  String title;
  String screen;

  DrawerModel({required this.icon, required this.title, required this.screen});
}

List<DrawerModel> drawerList = [
  DrawerModel(
      icon: Images.userProfile, title: "Profile", screen: Routes.profile),
  DrawerModel(icon: Images.home, title: "Dashboard", screen: Routes.dashboard),
  DrawerModel(
      icon: Images.edit, title: "Edit Profile", screen: Routes.editProfile),
  DrawerModel(icon: Images.help, title: "Help", screen: Routes.help),
  DrawerModel(icon: Images.logout, title: "Log Out", screen: Routes.logInView),
];

List<DrawerModel> drawerListFinal = [
  DrawerModel(icon: Images.help, title: "Help", screen: Routes.help),
  DrawerModel(icon: Images.logout, title: "Log Out", screen: Routes.logInView),
];
