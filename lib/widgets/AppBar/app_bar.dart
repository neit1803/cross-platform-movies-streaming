import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/config/app_text.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = AppColorConfig.background;
  final double appBarHeight = kToolbarHeight;

  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppTextsConfig.AppHeaderText("Home", current: true),
          const SizedBox(width: 25),
          AppTextsConfig.AppHeaderText("Discover"),
          const SizedBox(width: 25),
          AppTextsConfig.AppHeaderText("Movie Release"),
          const SizedBox(width: 25),
          AppTextsConfig.AppHeaderText("Forum"),
          const SizedBox(width: 25),
          AppTextsConfig.AppHeaderText("About"),
        ],
      ),
      leading: FlutterLogo(),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: AppIconsConfig.searchIcon,
        ),
        const SizedBox(width: 20),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: AppIconsConfig.notifcationIcon,
        ),
        const SizedBox(width: 20),
        CustomButton(content: "Sign Up", onPressed: () {}, isActive: false),
        const SizedBox(width: 10),
        CustomButton(content: "Login", onPressed: () {}, isActive: true),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
