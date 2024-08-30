import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies Streaming",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColorConfig.background,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}