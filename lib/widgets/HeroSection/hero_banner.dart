import 'dart:async';

import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeroBanner extends StatefulWidget {
  final Map<String, Object> movieData;
  final List<Map<String, Object>> categoriesData;
  final int numberMovies;
  final ValueChanged onDotClicked;
  int currentIndex;
  HeroBanner({super.key, required this.movieData, required this.categoriesData, required this.numberMovies, required this.onDotClicked, required this.currentIndex});

  @override
  State<HeroBanner> createState() => _HeroBanner();
}

class _HeroBanner extends State<HeroBanner> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _startAutoUpdate();
  }

  void _startAutoUpdate() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final String type = widget.movieData['type'].toString();
    final String time = widget.movieData['time'].toString();
    final String year = widget.movieData['year'].toString();
    final String category1 = widget.categoriesData[0]['name'].toString();
    final String category2 = widget.categoriesData[1]['name'].toString();
    final String title = widget.movieData['name'].toString();
    final String subtitle = "$time \u2981 $year \u2981 $category1 \u2981 $category2";
    final String content = widget.movieData['content'].toString();

    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(30),
        width: width,
        height: height,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  type,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(height: 20,),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                width: width * 0.4,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                width: width*0.4,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                width: width * 0.4,
                child: Text(
                  content,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  CustomButton(
                    content: "Watch Trailer",
                    onPressed: () {},
                    isActive: true,
                    icon: AppIconsConfig.playIcon,
                  ),
                  const SizedBox(width: 20),
                  CustomButton(
                    content: "Add Watchlist",
                    onPressed: () {},
                    isActive: false,
                    icon: AppIconsConfig.favoriteIcon,
                  ),
                  Spacer(),
                  AnimatedSmoothIndicator(
                    activeIndex: widget.currentIndex,
                    count: widget.numberMovies,
                    effect: WormEffect(
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey,
                    ),
                    onDotClicked: (index) {
                      setState(() {
                        widget.currentIndex = index;
                      });
                      widget.onDotClicked(index);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}