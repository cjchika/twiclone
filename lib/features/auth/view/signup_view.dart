import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:twiclone/common/small_rounded_button.dart';
import 'package:twiclone/constants/ui_constants.dart';
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
    // TODO: implement build
    throw UnimplementedError();
  }
}