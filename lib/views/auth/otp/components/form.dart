import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/home/view.dart';

import '../../../../core/design/responsive.dart';
import '../../components/logo.dart';

part 'btn.dart';
part 'pin_code.dart';

class OtpForm extends StatefulWidget {
  final String phone,otp;
  const OtpForm({Key? key, required this.phone, required this.otp}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {

  @override
  Widget build(BuildContext context) {
    String? code;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: !Responsive.isWeb(context) ? 24 : 100, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Logo(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Verification code",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: Color(0xff414D55)),
            ),
            const SizedBox(height: 13),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "We have sent the code verification\nto ${widget.phone}\t", style: const TextStyle(color: Color(0xff7B7B7B))),
                TextSpan(
                  text: "Not your mobile number ?",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                  style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w400),
                )
              ], style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w300)),
            ),
            const SizedBox(height: 40),
            _PinCode(
              onComplete: (value) {
                code = value;
              },
            ),
            const SizedBox(height: 40),
            _Btn(
              confirm: () {
                if (code == widget.otp) {
                  showMessage("Success", type: MessageType.success);
                  navigateTo(HomeView.route, keepHistory: false);
                } else {
                  showMessage("Invalid Code");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
