import 'dart:math';

import 'package:flutter/material.dart';

import '../logic/cache_helper.dart';

class AppBack extends StatelessWidget {
  final VoidCallback? onPress;

  const AppBack({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress ??
          () {
            Navigator.pop(context);
          },
      icon: Transform.rotate(
        angle: CacheHelper.lang == "en" ? pi : 0,
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
