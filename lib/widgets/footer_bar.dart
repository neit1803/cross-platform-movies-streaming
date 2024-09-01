import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Footer(
      child: Column(
        children: [
          const Divider(thickness: 2, color: AppColorConfig.divider),
          Container(
            height: height * 0.4,
          )
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
