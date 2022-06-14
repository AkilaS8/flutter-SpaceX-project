import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatefulWidget {
  List<String?>? imgList;

  ImageSliderWidget({required this.imgList});

  @override
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList!
        .map(
          (item) => Container(
            child: Image.network(
              item!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList!.map((url) {
            int index = widget.imgList!.indexOf(url);
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(255, 255, 255, 0.9)
                    : Color.fromRGBO(255, 255, 255, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
