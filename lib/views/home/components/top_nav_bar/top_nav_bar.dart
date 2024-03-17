import 'package:app/core/design/responsive.dart';
import 'package:app/views/home/components/top_nav_bar/tablet.dart';
import 'package:flutter/material.dart';

import 'mobile.dart';
import 'web.dart';

class TopNavBar extends StatelessWidget {
  final String title;

  const TopNavBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: TopNavBarMobile(title: title),
      tablet: TopNavBarTablet(title: title),
      web: TopNavBarWeb(title: title),
    );
  }
}
