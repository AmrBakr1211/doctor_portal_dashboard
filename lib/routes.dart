import 'package:app/core/design/app_image.dart';
import 'package:app/core/logic/cache_helper.dart';
import 'package:flutter/material.dart';

import 'views/home/pages/forms/view.dart';
import 'views/home/pages/soon.dart';
import 'views/home/pages/waiting_list/view.dart';
import 'views/home/view.dart';
import 'views/login/view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushedNamed
    return getPageRoute(const HomeView(), name: HomeView.route);

    final args = settings.arguments;
    switch (settings.name) {
      case "*":
        if (CacheHelper.isAuthed) {
          return getPageRoute(const HomeView(), name: HomeView.route);
        } else {
          return getPageRoute(const LoginView(), name: LoginView.route);
        }
      case LoginView.route:
        return getPageRoute(const LoginView(), name: LoginView.route);
      case HomeView.route:
        return getPageRoute(const HomeView(), name: HomeView.route);

      // case WaitingListPage.route:
      //   return getPageRoute(const WaitingListPage(), name: WaitingListPage.route);
      // case SoonView.route:
      //   final String title = settings.arguments as String;
      //   return getPageRoute(SoonView(title: title), name: SoonView.route);
      // case FormsPage.route:
      //   return getPageRoute(const FormsPage(), name: FormsPage.route);
      // case OrderDetailsView.route:
      //   if (args is OrderModel) {
      //     return MaterialPageRoute(
      //         builder: (context) => OrderDetailsView(
      //           model: args,
      //         ));
      //   } else {
      //     return _errorRoute();
      //   }
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AppImage(
            "not_found.jpg",
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}

PageRoute getPageRoute(Widget child, {required String name, RouteSettings? settings}) {
  return FadeRoute(
      child: child,
      settings: settings == null
          ? RouteSettings(name: name)
          : RouteSettings(
              name: name,
              arguments: settings.arguments,
            ));
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  FadeRoute({required this.child, super.settings})
      : super(
          pageBuilder: (_, Animation<double> animation, Animation<double> secondAnimation) => child,
          transitionDuration: const Duration(milliseconds: 5),
          reverseTransitionDuration: const Duration(milliseconds: 5),
          transitionsBuilder: (_, Animation<double> animation, Animation<double> secondAnimation, Widget child) =>
              FadeTransition(opacity: animation, child: child),
        );
}
