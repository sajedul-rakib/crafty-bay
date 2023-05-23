import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class ProductViewSlider extends StatelessWidget {
  const ProductViewSlider({
    super.key,
    required ValueNotifier<int> currentSliderPageIndex,
  }) : _currentSliderPageIndex = currentSliderPageIndex;

  final ValueNotifier<int> _currentSliderPageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
            items: [1, 2, 3, 4, 5]
                .map((e) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/shoe.png',
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
                for (int i = 0; i < 5; i++)
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
