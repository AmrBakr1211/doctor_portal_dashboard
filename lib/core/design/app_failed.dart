import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_button.dart';
import 'app_image.dart';

class AppFailed extends StatelessWidget {
  final int? statusCode;
  final VoidCallback onPress;
  final String msg;
  final bool isScrollable;
  final String? description;

  const AppFailed({
    super.key,
    this.statusCode,
    required this.msg,
    required this.onPress,
    this.description,  this.isScrollable=false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: isScrollable?null:const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: AppImage(
                msg.toLowerCase().contains("no internet")
                    ? "no_internet.jpg"
                    : "server_error.jpg",
                height: 240.h,
                width: 240.h,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (description != null)
              Text(
                description!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffBCBCBC),
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppButton(
                text: "Try Again",
                onPress: onPress,
              ),
            )
          ],
        ),
      ),
    );
  }
}
