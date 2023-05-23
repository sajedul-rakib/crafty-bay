import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';





class ProductReviewCart extends StatelessWidget {
  const ProductReviewCart({
    super.key,
  });

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
                const Text(
                  "Sajedul Islam Rakib",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "It is a long established fact that a reader"
                  " will be distracted by the readable content"
                  " of a page when looking at its layout."
                  " The point of using Lorem Ipsum is that it "
                  "has a more-or-less normal distribution of",
              style: TextStyle(
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
