import 'package:crafty_bay_ecommerce/views/ui/screens/category_wised_show_product/show_product_as_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors/app_colors.dart';

class CategoryCart extends StatelessWidget {
  const CategoryCart({
    super.key, this.categoryDetails,

  });

 final dynamic categoryDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(() => ShowProductAsCategoryName(
                categoryName:  categoryDetails.categoryName.toString(),
              ));
        },
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Image.network(
                categoryDetails.categoryImg,
              ),
            ),
            Text(
              categoryDetails.categoryName.toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: primaryColor,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
