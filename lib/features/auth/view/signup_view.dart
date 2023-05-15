import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:twiclone/common/common.dart';
import 'package:twiclone/constants/constants.dart';
import 'package:twiclone/features/auth/widgets/auth_field.dart';
import 'package:twiclone/theme/palette.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AuthField(controller: emailController, hintText: "Email"),
                const SizedBox(height: 20),
                AuthField(controller: passwordController, hintText: "Password"),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topRight,
                  child: SmallRoundedButton(
                    onTap: () {},
                    text: "Done",
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                    text:  TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle( fontSize: 16),
                        children: [
                          TextSpan(
                            text: " Sign up",
                            style: const TextStyle(color: Pallete.blueColor, fontSize: 16),
                            recognizer: TapGestureRecognizer()..onTap = () { },
                          ),
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}