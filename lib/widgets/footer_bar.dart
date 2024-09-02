import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/dimesion.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(Dimensions.padding(context, 30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            thickness: 2,
            color: AppColorConfig.divider,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height * 0.4,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildFooterContentLeft(),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: _buildFooterContentRight(),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterContentRight() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Home / ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              Text("Discover / ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              Text("Influence / ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              Text("Release",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("facebook icon", style: TextStyle(color: Colors.white)),
              SizedBox(width: 10),
              Text("instagram icon", style: TextStyle(color: Colors.white)),
              SizedBox(width: 10),
              Text("github", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterContentLeft() {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Our platform is trusted by millions & features the best updated movies in the world.",
              style: IntroductionTextStyle(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Row(
            children: [
              Text(
                "Privacy policy",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                "Term of service",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                "Languages",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

TextStyle IntroductionTextStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600);
}
