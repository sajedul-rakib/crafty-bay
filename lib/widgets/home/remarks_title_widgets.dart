import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';


class RemarksTitleWidgets extends StatelessWidget {
  const RemarksTitleWidgets({
    super.key, required this.remarksTitle, this.onPressed,
  });
final String remarksTitle;
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          remarksTitle,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black),
        ),
        const Spacer(),
        TextButton(
            onPressed: onPressed,
            child: Text(
              'See All',
              style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w700),
            ))
      ],
    );
  }
}
