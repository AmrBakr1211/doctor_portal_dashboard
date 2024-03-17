import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/design/app_button.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/design/app_input.dart';
import '../../../../features/auth/sign_in/bloc.dart';
import '../../components/logo.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<NavigatorState> navKey;

  const LoginForm({Key? key, required this.navKey}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final bloc = KiwiContainer().resolve<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Logo(),
              Form(
                key: bloc.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppInput(
                      label: "ID",
                      hint: "Enter your id",
                      controller: bloc.userIdController,
                      // validator: InputValidator.validatePhone,
                    ),
                    AppInput(
                      label: "Password",
                      hint: "Enter your password",
                      controller: bloc.passwordController,
                      // validator: bloc.validateUserId,
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 24),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is SignInSuccessState) {
                      navigateTo(HomeView.route,keepHistory: false);
                      // navigateTo(OTPView.route,
                      //     arguments: OTPArguments(
                      //       state.phone,
                      //       state.otp,
                      //     ));
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      text: "Log in",
                      isLoading: state is SignInLoadingState,
                      onPress: () {
                        bloc.add(SignInEvent());
                      },
                    );
                  }),
              const SizedBox(height: 40),
              const Center(
                child: AppImage(
                  "data_ocean.png",
                  height: 66,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
