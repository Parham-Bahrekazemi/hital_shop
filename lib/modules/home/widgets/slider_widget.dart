import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key, required this.iamges});

  final List<String> iamges;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: 1,
            height: 140,
            onPageChanged: (index, reason) {
              setState(() {
                currentindex = index;
              });
            },
          ),
          itemCount: widget.iamges.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 155,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.iamges[itemIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.iamges.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(left: 2),
                width: index == currentindex ? 20 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: index == currentindex
                      ? Colors.white
                      : const Color(0xffD2D2D2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
