import 'dart:async';

import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/config/dimesion.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeroBanner extends StatefulWidget {
  final Map<String, Object> movieData;
  final List<Map<String, Object>> categoriesData;
  final int numberMovies;
  final ValueChanged onDotClicked;
  int currentIndex;


    late String type = movieData['type'].toString();
    late String time = movieData['time'].toString();
    late String year = movieData['year'].toString();
    late String category1 = categoriesData[0]['name'].toString();
    late String category2 = categoriesData[1]['name'].toString();
    late String title = movieData['name'].toString();
    late String subtitle = "$time \u2981 $year \u2981 $category1 \u2981 $category2";
    late String content = movieData['content'].toString();

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

    return InkWell(
      child: Dimensions.isMobile(context)? mobileVersion(context, width, height) : desktopVersion(context, width, height)
    );
  }

  Widget mobileVersion(context, width, height) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding(context, 30)),
      width: width,
      height: height,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    widget.type,
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6,),
          FadeTransition(
            opacity: _opacityAnimation,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
          FadeTransition(
            opacity: _opacityAnimation,
            child: Container(
              width: width,
              child: Text(
                widget.subtitle,
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
              width: width,
              child: Text(
                widget.content,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      content: "Watch Trailer",
                      onPressed: () {},
                      isActive: true,
                      icon: AppIconsConfig.playIcon,
                    ),
                    SizedBox(width: 12),
                    CustomButton(
                      content: "Add Watchlist",
                      onPressed: () {},
                      isActive: false,
                      icon: AppIconsConfig.favoriteIcon,
                    ),
                  ],
                ),
                const SizedBox(height: 20),      
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
                    clickedDot(index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget desktopVersion(context, width, height) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding(context, 30)),
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
                widget.type,
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
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.fontSize(context, 40),
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
                widget.subtitle,
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
                widget.content,
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
                    clickedDot(index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clickedDot(index) {
    setState(() {
        widget.currentIndex = index;
      });
    widget.onDotClicked(index);
  }

}