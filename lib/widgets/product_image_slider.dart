
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../u_color/u_color.dart' show UColor;

class ProductImageSlider extends StatefulWidget {
  final List<String> imageList;
  const ProductImageSlider({super.key, required this.imageList});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  ValueNotifier<int> valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(

          options: CarouselOptions(

            viewportFraction: 1,
            height: 350.0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),

            onPageChanged: (int page, _) {
              valueNotifier.value = page;
            },
          ),
          items: widget.imageList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.brown.shade100,image: DecorationImage(image: NetworkImage(i))),

                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Positioned(
          bottom: 10,left: 0,right: 0,
          child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.imageList.length; i++) {
                list.add(
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 29,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                      color: value == i ? UColor.brown : Colors.white,
                    ),
                  ),
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            },
          ),
        ),
      ],
    );
  }
}