import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twiclone/common/common.dart';
import 'package:twiclone/common/loading_page.dart';
import 'package:twiclone/constants/constants.dart';
import 'package:twiclone/features/auth/view/signup_view.dart';
import 'package:twiclone/features/auth/widgets/auth_field.dart';
import 'package:twiclone/theme/palette.dart';

import '../controller/auth_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
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
                      const Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      const SizedBox(height: 40),
                      AuthField(controller: emailController, hintText: "Email"),
                      const SizedBox(height: 20),
                      AuthField(
                          controller: passwordController, hintText: "Password"),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.topRight,
                        child: SmallRoundedButton(
                          onTap: onLogin,
                          text: "Done",
                        ),
                      ),
                      const SizedBox(height: 30),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: const TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: " Sign up",
                              style: const TextStyle(
                                  color: Pallete.blueColor, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    LoginView.route(),
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
    );
  }
}
