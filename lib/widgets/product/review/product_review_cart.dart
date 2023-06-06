import 'package:crafty_bay_ecommerce/data/models/product/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductReviewCart extends StatelessWidget {
  const ProductReviewCart({
    super.key,
    required this.reviewDescription,
    this.profile,
  });

  final String reviewDescription;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Colors.black38, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "${profile?.firstName ?? ''} ${profile?.lastName ?? ''}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              reviewDescription,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
