import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ProductSize extends StatefulWidget {
  ProductSize({
    super.key,
  });

  final List<String> productSizes = [
    'S',
    'L',
    'XL',
    'XXL',
  ];

  String selectedProductSize = "S";

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Size",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black38),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.productSizes
              .map((size) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (widget.selectedProductSize != size) {
                        widget.selectedProductSize = size;
                        if (mounted) {
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: widget.selectedProductSize == size
                              ? primaryColor
                              : null,
                          shape: BoxShape.circle,
                          border: Border.all(width: 1)),
                      child: Center(
                          child: Text(
                        size,
                        style: widget.selectedProductSize == size
                            ? const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)
                            : null,
                      )),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
