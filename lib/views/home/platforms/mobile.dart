import 'package:flutter/material.dart';

class HomeViewMobile extends StatelessWidget {
  final Widget sideNavBar, navigator,topNavBar;

  const HomeViewMobile({
    Key? key,
    required this.sideNavBar,
    required this.navigator,
    required this.topNavBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: sideNavBar),
      body: SafeArea(
        child: Column(
          children: [
            topNavBar,
            Expanded(child: navigator),
          ],
        ),
      ),
    );
  }
}
