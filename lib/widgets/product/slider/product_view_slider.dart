import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class ProductViewSlider extends StatelessWidget {
   ProductViewSlider({
    super.key, required this.productImages,
  })  ;


   final List<String> productImages;
  final ValueNotifier<int> _currentSliderPageIndex = ValueNotifier(0);


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
            items: productImages
                .map((productImage) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Image.network(
                          productImage,
                          width: 250,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
                onPageChanged: (value, _) {
                  _currentSliderPageIndex.value = value;
                },
                viewportFraction: 1,
                height: 250,
                autoPlayInterval: const Duration(seconds: 2))),
        ValueListenableBuilder(
          valueListenable: _currentSliderPageIndex,
          builder: (BuildContext context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < productImages.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: i == index ? primaryColor : Colors.grey,
                        shape: BoxShape.circle),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
