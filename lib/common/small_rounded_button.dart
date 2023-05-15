import 'package:flutter/material.dart';
import 'package:twiclone/theme/palette.dart';

class SmallRoundedButton extends StatelessWidget {
  const SmallRoundedButton(
      {super.key,
      required this.onTap,
      required this.text,
       this.backgroundColor = Pallete.whiteColor,
       this.textColor = Pallete.backgroundColor});

  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: TextStyle(color: textColor, fontSize: 16),),
      backgroundColor: backgroundColor,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
    );
  }
}









