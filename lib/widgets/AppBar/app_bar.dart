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
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: FlutterLogo(),
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
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: AppIconsConfig.searchIcon,
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: AppIconsConfig.notifcationIcon,
          ),
          SizedBox(
            width: 20,
          ),
          CustomButton(content: "Sign Up", onPressed: () {}, isActive: false),
          SizedBox(width: 10),
          CustomButton(content: "Login", onPressed: () {}, isActive: true),

          // CustomButton(
          //   content: "Add Watchlist",
          //   onPressed: (){},
          //   isActive: false,
          //   icon: AppIconsConfig.favoriteIcon,
          // ),

          // InkWell(
          //   customBorder: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20)
          //   ),
          //   child: Container(
          //     child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         CircleAvatar(
          //           backgroundColor: Colors.white,
          //           child: SvgPicture.network(
          //             "https://api.dicebear.com/9.x/adventurer/svg?seed=Annie",
          //           ),
          //         ),
          //         const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),
          //       ],
          //     ),
          //   ),
          //   onTap: (){},
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
