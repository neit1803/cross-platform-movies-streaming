import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeroSection extends StatefulWidget {
  final List<Map<String, Object>> datas;

  const HeroSection({
    super.key,
    required this.datas,
  });

  @override
  State<HeroSection> createState() => _HeroSection();
}

class _HeroSection extends State<HeroSection> {
  int currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width * 0.5625; // Set height to maintain a 16:9 aspect ratio

    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 50),
      child: FeatureMovies(width, height, _controller),
    );
  }

  Widget FeatureMovies(
      double width, double height, CarouselSliderController controller) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: widget.datas.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              widget.datas[itemIndex]['thumb_url'].toString(),
              fit: BoxFit.fitWidth,
              height: height,
            ),
          ),
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 16 / 9, // Set height to maintain aspect ratio
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: widget.datas.length,
              effect: WormEffect(
                dotHeight: 8.0,
                dotWidth: 8.0,
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
              ),
              onDotClicked: (index) {
                controller.animateToPage(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
