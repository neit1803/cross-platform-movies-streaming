import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/dimesion.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final VoidCallback onPressed;
  final bool isActive;
  final Icon? icon;
  const CustomButton(
      {super.key,
      required this.content,
      required this.onPressed,
      this.icon,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ? AppColorConfig.button : Colors.transparent,
          side: !isActive ? BorderSide(width: 1.0, color: Colors.white) : null,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Set to zero for square corners
          ),
          padding: EdgeInsets.all(Dimensions.padding(context, 16)), // Optional: to set padding
        ),
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!],
            if (icon != null) const SizedBox(width: 8.0),
            Text("$content"),
          ],
        ),
      )
    ]));
  }
}
