import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String movieTitle;
  final VoidCallback onPressed;
  final int rating;
  final String poster;
  final String type;
  final bool? isActive;

  const MovieCard(
      {super.key,
      required this.movieTitle,
      required this.rating,
      required this.type,
      required this.onPressed,
      required this.poster,
      this.isActive});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: isActive == true
                  ? Border.all(color: AppColorConfig.button, width: 2.0)
                  : Border.all(width: 0, color: Colors.transparent)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackgroundImage(),
              _buildGradientOverlay(),
              _buildTitleText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(poster),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity((type == "New release" ? 0.1 : 0.3)),
            Colors.black.withOpacity(1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildTitleText() {
    return Positioned(
      bottom: 8,
      left: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieTitle,
            style: _titleTextStyle(),
          ),
          Row(
            children: [
              AppIconsConfig.ratingIcon,
              SizedBox(width: 5),
              Text(
                "4.8 | ",
                style: _subTitleTextStyle(),
              ),
              Text(
                '$type - movie',
                style: _typeTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle _subTitleTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 11,
    );
  }

  TextStyle _typeTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: const Color.fromARGB(59, 202, 202, 202),
    );
  }
}
