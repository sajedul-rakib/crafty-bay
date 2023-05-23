import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class HomeCarouselSlider extends StatelessWidget {
  HomeCarouselSlider({
    super.key,
    required this.carouselData,
  });

  final List carouselData;

  final ValueNotifier<int> currentSliderPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onPageChanged: (index, _) {
                currentSliderPageIndex.value = index;
              },
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4)),
          items: carouselData.map((singleCarouselData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Image.network(singleCarouselData.image),
                            )),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 25,),
                              Text(
                                singleCarouselData.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Buy Now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: currentSliderPageIndex,
          builder: (context, currentValue, _) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 1; i <= carouselData.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: currentValue == i ? primaryColor : null,
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.circle),
                )
            ],
          ),
        ),
      ],
    );
  }
}
