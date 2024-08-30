import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void helloWorld() {
    print("hello world");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  CustomButton(
                      content: "Login", onPressed: helloWorld, isActive: true),
                  SizedBox(height: 10),
                  CustomButton(
                    content: "Add Watchlist",
                    onPressed: helloWorld,
                    isActive: false,
                    icon: AppIconsConfig.favoriteIcon,
                  ),
                ],
              ))),
    );
  }
}
