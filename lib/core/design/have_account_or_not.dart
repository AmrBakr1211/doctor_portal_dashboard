import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/auth/register/view.dart';

import '../../generated/locale_keys.g.dart';

class HaveAccountOrNo extends StatelessWidget {
  final bool isCreate;

  const HaveAccountOrNo({Key? key, this.isCreate = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: isCreate
                  ? "Don't have a medical record?\t"
                  : "Already have an account? ",
            ),
            TextSpan(
              text: isCreate ? "New patient" : LocaleKeys.login.tr(),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (isCreate) {
                    navigateTo(RegisterView.route);
                    // navKey.currentState!.pushNamed(RegisterForm.route);
                  } else {
                    Navigator.pop(context);

                    // navKey.currentState!.pop();
                  }
                },
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff414D55)),
        ),
      ),
    );
  }
}
