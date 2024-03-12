import 'package:flutter/material.dart';

class OTPViewMobile extends StatelessWidget {
  final Widget form;

  const OTPViewMobile({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: form);
  }
}
