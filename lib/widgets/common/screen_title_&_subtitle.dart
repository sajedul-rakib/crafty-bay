import 'package:flutter/material.dart';


class ScreenTitleSubtitle extends StatelessWidget {
  const ScreenTitleSubtitle({Key? key, required this.title,  this.subTitle}) : super(key: key);

  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          title,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              wordSpacing: 5),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(subTitle ?? '',style: TextStyle(
            fontWeight: FontWeight.w800,
            wordSpacing: 2,
            letterSpacing: 1,
            color: Colors.grey.shade500
        ),),
      ],
    );
  }
}
