import 'package:flutter/material.dart';


class AppRefresh extends StatelessWidget {
  final VoidCallback event;
  final Widget child;

  const AppRefresh({super.key, required this.event, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
        event();
      },
      child: child,
    );
  }
}
