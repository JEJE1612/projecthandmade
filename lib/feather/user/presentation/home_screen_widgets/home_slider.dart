import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:handmade/cors/theme/colors.dart';

class HomeSlider extends StatefulWidget {
  final List sliders = [
    'https://cdn.pixabay.com/photo/2016/01/13/22/48/pottery-1139047_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/11/07/14/40/fabric-1031932_1280.jpg',
    'https://stitchberryblog.com/wp-content/uploads/2020/12/IMG_7061_jpg-1536x1152.jpg',
    'https://cdn.pixabay.com/photo/2016/10/18/19/44/glass-1751210_1280.jpg',
    "https://cdn.pixabay.com/photo/2014/09/15/23/33/cupcake-soap-447655_1280.jpg",
  ];

  HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          sliderData,
                        )),
                    color: primary,
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        const Gap(8),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < widget.sliders.length; i++) {
              list.add(
                Container(
                  width: 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: value == i ? primary : Colors.black54),
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
