import 'package:app/core/design/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import '../../../core/design/app_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../features/auth/sign_in/bloc.dart';
import '../home/view.dart';

class LoginView extends StatefulWidget {
  static const route = "/login";

  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = KiwiContainer().resolve<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
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
              child: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Welcome to",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Abdul Latif Jameel Hospital and Rehabilitation",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Form(
                          key: bloc.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppInput(
                                label: "ID",
                                prefix: "id.svg",
                                hint: "Enter your id",
                                keyboardType: TextInputType.number,
                                controller: bloc.userIdController,
                                validator: bloc.validateUserId,
                              ),
                              AppInput(
                                label: "Password",
                                prefix: "password.svg",
                                hint: "Enter your password",
                                controller: bloc.passwordController,
                                inputType: InputType.password,
                                validator: bloc.validatePassword,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        BlocConsumer(
                            bloc: bloc,
                            listener: (context, state) {
                              if (state is SignInSuccessState) {
                                navigateTo(HomeView.route, keepHistory: false);
                              }
                            },
                            builder: (context, state) => AppButton(
                                  text: "Log in",
                                  isLoading: state is SignInLoadingState,
                                  onPress: () {
                                    bloc.add(SignInEvent());
                                  },
                                )),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
