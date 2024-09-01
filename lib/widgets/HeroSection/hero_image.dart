import 'package:flutter/material.dart';

class HeroImage extends StatefulWidget {
  String imgUrl;
  HeroImage({super.key, required this.imgUrl});

  @override
  State<HeroImage> createState() => _HeroImage();
}

class _HeroImage extends State<HeroImage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Image.network(
      widget.imgUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}