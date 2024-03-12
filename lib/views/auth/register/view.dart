import 'package:flutter/material.dart';

import '../../../core/design/responsive.dart';
import 'components/form.dart';
import 'mobile.dart';
import 'web.dart';

class RegisterView extends StatelessWidget {
  static const route = "/register";

  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: RegisterViewMobile(form: form,),
      web: RegisterViewWeb(form: form,),
    );
  }
  Widget get form {
    return const RegisterForm();
  }
}
