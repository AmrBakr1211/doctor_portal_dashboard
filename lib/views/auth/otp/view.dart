import 'package:flutter/material.dart';

import '../../../core/design/responsive.dart';
import 'components/form.dart';
import 'mobile.dart';
import 'web.dart';

class OTPView extends StatelessWidget {
  static const route = "/otp";
  final OTPArguments args;

  const OTPView({Key? key, required this.args}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: OTPViewMobile(
        form: form,
      ),
      web: OTPViewWeb(
        form: form,
      ),
    );
  }

  Widget get form {
    return OtpForm(
      phone: args.phone,
      otp: args.otp,
    );
  }
}

class OTPArguments {
  final String phone;
  final String otp;

  OTPArguments(this.phone, this.otp);
}
