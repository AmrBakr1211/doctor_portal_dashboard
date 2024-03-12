import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';

import 'mobile.dart';

class OTPViewWeb extends StatelessWidget {
  final Widget form;
  const OTPViewWeb({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: OTPViewMobile(form: form),
          ),
          const Expanded(
            child: AppImage(
              "img_otp.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
