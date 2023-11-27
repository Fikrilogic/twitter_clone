import 'dart:developer';

import 'package:authentication/signin/signin_view.dart';
import 'package:authentication/signup/bloc/signup_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/di/di.dart';
import 'package:core/core.dart';

import '../widget/auth_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignupView(),
      );

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _signupBloc = getIt.get<SignupBloc>();

  void onSignup(BuildContext context) {
    try {
      _signupBloc.add(const OnSubmitRegister());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: ReusableAppBar(
          onClickBack: () {
            Navigator.push(context, SigninView.route());
          },
        ),
      ),
      body: BlocProvider<SignupBloc>.value(
        value: _signupBloc,
        child: BlocConsumer<SignupBloc, SignupInitial>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.loading
                ? const LoaderPage()
                : BlocListener<SignupBloc, SignupInitial>(
                    listener: (context, state) {
                      if (state.message.isNotEmpty) {
                        showSnackbar(context, state.message);
                      }

                      if (state.signupStatus) {
                        Navigator.push(context, SigninView.route());
                      }
                    },
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              BlocBuilder<SignupBloc, SignupInitial>(
                                buildWhen: (previous, current) =>
                                    previous.email != current.email,
                                builder: (context, state) => AuthField(
                                  key: const Key("login_email_textfield"),
                                  labelText: "email",
                                  onChanged: (value) => context
                                      .read<SignupBloc>()
                                      .add(EmailTextFieldChanged(email: value)),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              BlocBuilder<SignupBloc, SignupInitial>(
                                buildWhen: (previous, current) =>
                                    previous.email != current.email,
                                builder: (context, state) => AuthField(
                                  key: const Key("login_password_textfield"),
                                  labelText: "password",
                                  onChanged: (value) => context
                                      .read<SignupBloc>()
                                      .add(PasswordTextFieldChanged(
                                          password: value)),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: RoundedSmallButton(
                                    onTap: () => onSignup(context),
                                    label: "Done"),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "have an account?",
                                  style: const TextStyle(fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text: " Login",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Pallete.blueColor,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context, SigninView.route());
                                        },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
