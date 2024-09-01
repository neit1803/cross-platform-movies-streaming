import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandBlock extends StatelessWidget {
  final String assetsLink;
  const BrandBlock({super.key, required this.assetsLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColorConfig.brandLabel,
          borderRadius: BorderRadius.circular(15)),
      child: SvgPicture.asset(
        "$assetsLink",
        fit: BoxFit.contain,
      ),
    );
  }
}
