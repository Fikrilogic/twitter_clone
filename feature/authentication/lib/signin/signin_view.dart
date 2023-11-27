import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:home/home.dart';

import '../signin/bloc/signin_bloc.dart';
import '../signup/signup_view.dart';
import '../widget/auth_field.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SigninView(),
      );

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final SigninBloc _signinBloc = getIt.get<SigninBloc>();

  void onSignIn(BuildContext context) {
    _signinBloc.add(const OnSubmitSignin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ReusableAppBar(),
      ),
      body: BlocProvider<SigninBloc>.value(
        value: _signinBloc,
        child: BlocConsumer<SigninBloc, SigninInitial>(
          listener: (context, state) {

            if(state.message.isNotEmpty){
              showSnackbar(context, state.message);
            }

            if(state.loginStatus){
              Navigator.push(context, HomeView.route());
            }
          },
          builder: (context, state) => state.loading
              ? const LoaderPage()
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          BlocBuilder<SigninBloc, SigninInitial>(
                            builder: (context, state) => AuthField(
                              onChanged: (value) {
                                context
                                    .read<SigninBloc>()
                                    .add(EmailTextFieldChange(email: value));
                              },
                              labelText: "email",
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          BlocBuilder<SigninBloc, SigninInitial>(
                            builder: (context, state) => AuthField(
                              onChanged: (value) {
                                context.read<SigninBloc>().add(
                                    PasswordTextFieldChange(password: value));
                              },
                              labelText: "password",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: RoundedSmallButton(
                                onTap: () => onSignIn(context), label: "Done"),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account?",
                              style: const TextStyle(fontSize: 16),
                              children: [
                                TextSpan(
                                  text: " Sign Up",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Pallete.blueColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        SignupView.route(),
                                      );
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
        ),
      ),
    );
  }
}
