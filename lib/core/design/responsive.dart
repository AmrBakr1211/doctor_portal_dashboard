import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile, web;
  final Widget? tablet;

  const Responsive(
      {Key? key, required this.mobile, this.tablet, required this.web})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static int gridViewItemCount(BuildContext context) {
    return isWeb(context)
        ? 2
        : isTablet(context)
            ? 2
            : 1;
  }
  static int gridView3ItemCount(BuildContext context) {
    return isWeb(context)
        ? 3
        : isTablet(context)
        ? 2
        : 1;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return web;
        } else if (constraints.maxWidth >= 650) {
          return tablet ?? mobile;
        }
        return mobile;
      },
    );
  }
}
