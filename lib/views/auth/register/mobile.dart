import 'package:flutter/material.dart';

class RegisterViewMobile extends StatelessWidget {
  final Widget form;

  const RegisterViewMobile({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: form,
    );
  }
}
