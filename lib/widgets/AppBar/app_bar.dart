import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/config/app_text.dart';
import 'package:cross_platform_flms_application/config/dimesion.dart';
import 'package:cross_platform_flms_application/screens/home/home_screen.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = AppColorConfig.background;
  final double appBarHeight = 80;

  CustomAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:  EdgeInsets.only(top: Dimensions.height(context, 30)),
        child: AppBar(
          leadingWidth: 150,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: Container(
            width: 500,
            padding: EdgeInsets.only(left: Dimensions.padding(context, 60)),
            child: FlutterLogo(),
          ),
          title: Dimensions.isMobile(context)? 
          Container(

          )
          :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: AppTextsConfig.AppHeaderText("Home", current: true),
                onPressed: (){},
              ),
              const SizedBox(width: 25),
              TextButton(
                child: AppTextsConfig.AppHeaderText("Discover"),
                onPressed: () {},
              ),
              const SizedBox(width: 25),
              TextButton(
                child: AppTextsConfig.AppHeaderText("Movie Release"),
                onPressed: () {},
              ),
              const SizedBox(width: 25),
              TextButton(
                child: AppTextsConfig.AppHeaderText("Forum"),
                onPressed: (){},
              ),
              const SizedBox(width: 25),
              TextButton(
                child: AppTextsConfig.AppHeaderText("About"),
                onPressed: (){},  
              ),
            ],
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: AppIconsConfig.searchIcon,
            ),
            const SizedBox(width: 20),
            Dimensions.isMobile(context)?
            Builder(builder: (context) {
              return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  });
            })
            :
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: AppIconsConfig.notifcationIcon,
            ),
            const SizedBox(width: 20),
            // CustomButton(content: "Sign Up", onPressed: () {}, isActive: false),
            // const SizedBox(width: 10),
            // Padding(
            //   padding: const EdgeInsets.only(right: 100.0),
            //   child: CustomButton(content: "Login", onPressed: () {}, isActive: true),
            // ),
            Dimensions.isMobile(context)? 
            Container()
            :
            Padding(
              padding: EdgeInsets.only(right: 60),
              child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SvgPicture.network(
                        "https://api.dicebear.com/9.x/adventurer/svg?seed=Angel",
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),
                  ],
                ),
              ),
              onTap: (){},
                        ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
