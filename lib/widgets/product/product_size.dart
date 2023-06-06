import 'package:crafty_bay_ecommerce/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ProductSize extends StatefulWidget {
  const ProductSize({
    super.key,
    required this.productSizes,
  });

  final List<String> productSizes;

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  String? _selectedProductSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Size",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black38),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.productSizes
              .map((size) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (_selectedProductSize != size) {
                        _selectedProductSize = size;
                        if (mounted) {
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: _selectedProductSize == size
                              ? primaryColor
                              : null,
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: Text(
                        size,
                        style: _selectedProductSize == size
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
