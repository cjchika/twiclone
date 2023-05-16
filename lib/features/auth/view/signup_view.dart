import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twiclone/common/common.dart';
import 'package:twiclone/common/loading_page.dart';
import 'package:twiclone/constants/constants.dart';
import 'package:twiclone/features/auth/controller/auth_controller.dart';
import 'package:twiclone/features/auth/widgets/auth_field.dart';
import 'package:twiclone/theme/palette.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignup() {
    ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthField(controller: emailController, hintText: "Email"),
                      const SizedBox(height: 20),
                      AuthField(
                          controller: passwordController, hintText: "Password"),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.topRight,
                        child: SmallRoundedButton(
                          onTap: onSignup,
                          text: "Done",
                        ),
                      ),
                      const SizedBox(height: 30),
                      RichText(
                          text: TextSpan(
                              text: "Already have an account?",
                              style: const TextStyle(fontSize: 16),
                              children: [
                            TextSpan(
                              text: " Login",
                              style: const TextStyle(
                                  color: Pallete.blueColor, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context, SignUpView.route());
                                },
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
