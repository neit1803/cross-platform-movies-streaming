import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:flutter/material.dart';

class DirectionButton extends StatelessWidget {
  final String direction;
  final VoidCallback onPressed;

  const DirectionButton({
    super.key,
    required this.direction,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Opacity(
      opacity: 0.6,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColorConfig.directionButton,
            shape: CircleBorder(), // Change shape to CircleBorder
            padding: EdgeInsets.all(16.0), // Adjust padding as needed
          ),
          onPressed: onPressed,
          child: direction == "forward"
              ? AppIconsConfig.forwardIcon
              : AppIconsConfig.backwardIcon),
    ));
  }
}
