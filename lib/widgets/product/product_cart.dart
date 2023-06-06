import 'package:crafty_bay_ecommerce/views/ui/screens/home_screen/data/models/product.dart';
import 'package:crafty_bay_ecommerce/views/ui/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors/app_colors.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    Key? key,
    this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 180,
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailScreen(
            productId: product?.id.toString() ?? "",
          ));
        },
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: primaryColor.withOpacity(0.1),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: primaryColor.withOpacity(0.45),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Image.network(
                    '${product?.image ?? ''}',
                    width: 120,
                    height: 90,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product?.title ?? '',
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.3,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          color: primaryColor.withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${product?.price ?? ''}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Text(
                              '${product?.star ?? ''}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
