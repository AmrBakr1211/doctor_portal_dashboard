import 'package:flutter/material.dart';

class HomeViewWeb extends StatelessWidget {
  final Widget sideNavBar, navigator,topNavBar;


  const HomeViewWeb({
    Key? key,
    required this.sideNavBar,
    required this.navigator,
    required this.topNavBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          sideNavBar,
          Expanded(
              child: Column(
            children: [
              topNavBar,
              Expanded(child: navigator),
            ],
          )),
        ],
      ),
    );
  }
}
