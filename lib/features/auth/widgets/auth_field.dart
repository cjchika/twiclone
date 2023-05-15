import 'package:flutter/material.dart';
import 'package:twiclone/theme/palette.dart';

class AuthField extends StatelessWidget {
  const AuthField({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Pallete.blueColor, width: 2),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText
      ),
    );
  }
}










