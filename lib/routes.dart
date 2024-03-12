import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';

class AppRoutes {
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   LoginView.route: (context) => const LoginView(),
  //   RegisterView.route: (context) => const RegisterView(),
  //   // OTPView.route: (context) => const OTPView(),
  //   HomeView.route: (context) => HomeView(),
  // };

  static Route<dynamic> errorRoute(String name) {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //     title: const Text(
        //       "Error",
        //       style: TextStyle(color: Colors.black),
        //     ),
        //     automaticallyImplyLeading: false),
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
