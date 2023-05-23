import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton(
      {super.key, required this.text, this.onPressed, this.isValid = true});

  final String text;
  final VoidCallback? onPressed;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: isValid
              ? primaryColor
              : primarySoftColor,
          padding: const EdgeInsets.all(8)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
