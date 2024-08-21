import 'package:benmore/core/constants/app_routes.dart';
import 'package:benmore/core/utils/dashboard_data.dart';
import 'package:benmore/ui/dashboard/dashboard_view.dart';
import 'package:benmore/ui/edit_post/create_post.dart';
import 'package:benmore/ui/edit_post/edit_post_view.dart';
import 'package:benmore/ui/login/login_view.dart';
import 'package:benmore/ui/profile/profile_view.dart';
import 'package:benmore/ui/signup/edit_profile.dart';
import 'package:benmore/ui/signup/signup_view.dart';
import 'package:benmore/ui/splash/splash_view.dart';
import 'package:benmore/ui/view_post/view_post_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routers {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments is Map<String, dynamic> &&
            (settings.arguments as Map<String, dynamic>)
                .containsKey('arguments')
        ? (settings.arguments as Map<String, dynamic>)['arguments']
        : settings.arguments;
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SplashView(), settings: settings);
      case Routes.dashboard:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const DashboardView(), settings: settings);
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SignUpView(), settings: settings);
      case Routes.profile:
        return MaterialPageRoute<dynamic>(
            builder: (context) => ProfileView(
                userId: args['userId'] as String,
                isSelf: args['isSelf'] as bool),
            settings: settings);
      case Routes.logInView:
        return MaterialPageRoute<dynamic>(
            builder: (context) =>
                LoginView(isChecked: args['isChecked'] as bool),
            settings: settings);
      case Routes.viewPost:
        return MaterialPageRoute<dynamic>(
            builder: (context) => ViewPostView(
                dashboardItem: args['dashboardItem'] as DashboardItem),
            settings: settings);
      case Routes.editPost:
        return MaterialPageRoute<dynamic>(
            builder: (context) => EditPostView(
                dashboardItem: args['dashboardItem'] as DashboardItem),
            settings: settings);
      case Routes.createPost:
        return MaterialPageRoute<dynamic>(
            builder: (context) => CreatePostView(), settings: settings);
      case Routes.editProfile:
        return MaterialPageRoute<dynamic>(
            builder: (context) => EditProfileView(), settings: settings);
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == '/'
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton.icon(
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
