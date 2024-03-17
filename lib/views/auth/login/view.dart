import 'package:app/core/design/responsive.dart';
import 'package:app/views/auth/login/components/form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const route = "/login";

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: AlignmentDirectional.bottomCenter,
            begin: AlignmentDirectional.topCenter,
            colors: [
              Color(0xff5597F5),
              Color(0xff3C6FB5),
              Color(0xff224372),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 629,
            height: 678,
            decoration: !Responsive.isMobile(context)
                ? BoxDecoration(
                    gradient: LinearGradient(
                      end: AlignmentDirectional.bottomCenter,
                      begin: AlignmentDirectional.topCenter,
                      colors: [
                        Colors.white.withOpacity(.12),
                        Colors.white.withOpacity(.096),
                      ],
                    ),
                    border: Border.all(color: Colors.white.withOpacity(.32)),
                    borderRadius: BorderRadius.circular(24))
                : null,
            child: form,
          ),
        ),
      ),
    );
  }

  Widget get form {
    return LoginForm(navKey: GlobalKey<NavigatorState>());
  }
}
