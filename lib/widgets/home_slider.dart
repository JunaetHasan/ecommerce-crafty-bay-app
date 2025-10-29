
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/model/slider_data.dart';
import 'package:flutter/material.dart';

import '../u_color/u_color.dart' show UColor;

class HomeSlider extends StatefulWidget {

  final List<SliderData> slider;

  const HomeSlider({super.key, required this.slider});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  ValueNotifier<int> valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(

            viewportFraction: 1,
            height: 200.0,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),

            onPageChanged: (int page, _) {valueNotifier.value = page;},
          ),
          items: widget.slider.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(

                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.brown.shade100,
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image(image: NetworkImage(sliderData.image ?? '')),
                      Text(sliderData.title ?? ''),
                      Text(sliderData.shortDes ?? ''),
                    ],
                  )
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < widget.slider.length; i++) {
              list.add(
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 29,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                    color: value == i ? UColor.brown : null,
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
      ],
    );
  }
}