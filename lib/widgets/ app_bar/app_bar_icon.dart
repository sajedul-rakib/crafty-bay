import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.iconData,
    this.onPressed,
  });

  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.grey.shade400,
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: Colors.black,
            )));
  }
}
