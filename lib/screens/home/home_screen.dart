import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/widgets/AppBar/app_bar.dart';
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
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 15.0),
        ),
      ),
    );
  }
}
