import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductColor extends StatefulWidget {
  const ProductColor({super.key, required this.colors});

  final List<Color> colors;

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {

  Color? _selectedColor;



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
                      if (_selectedColor != color) {
                        _selectedColor = color;
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
                        visible: _selectedColor == color,
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
