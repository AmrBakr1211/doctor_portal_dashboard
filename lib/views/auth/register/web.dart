import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';

import 'mobile.dart';

class RegisterViewWeb extends StatelessWidget {
  final Widget form;
  final bool isRegister;
  const RegisterViewWeb({Key? key, required this.form,  this.isRegister=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RegisterViewMobile(form: form),
          ),
          const Expanded(
            child: AppImage(
              "img_register.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
