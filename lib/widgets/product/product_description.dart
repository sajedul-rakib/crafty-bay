import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.productDescription,
  });

  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          productDescription,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black38),
        )
      ],
    );
  }
}
