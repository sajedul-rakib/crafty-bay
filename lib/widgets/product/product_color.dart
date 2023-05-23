import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductColor extends StatefulWidget {
  ProductColor({
    super.key,
  });

  final List<Color> colors = [
    const Color(0xffD500F9),
    const Color(0xff651FFF),
    const Color(0xff3D5AFE),
    const Color(0xff00E5FF),
    const Color(0xff1DE9B6)
  ];

  Color selectedColor = const Color(0xffD500F9);

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black38),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.colors
              .map((color) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (widget.selectedColor != color) {
                        widget.selectedColor = color;
                        if (mounted) {
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 40,
                      width: 40,
                      decoration:
                          BoxDecoration(color: color, shape: BoxShape.circle),
                      child: Visibility(
                        visible: widget.selectedColor == color,
                        child: const Icon(
                          color: Colors.white,
                          size: 30,
                          CupertinoIcons.checkmark_alt,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
