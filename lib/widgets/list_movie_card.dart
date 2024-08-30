import 'dart:ui';

import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cross_platform_flms_application/widgets/movie_card.dart';

class ListMovieCard extends StatelessWidget {
  final String genre;
  final List<Map<String, Object>> datas;

  const ListMovieCard({
    super.key,
    required this.genre,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      child: ColumnMovieCard(width, height),
    );
  }

  Widget _buildGradientOverlay(double height) {
    return Positioned(
      top: 0,
      right: 0, // Di chuyển gradient overlay về bên trái
      child: Container(
        width: 70,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColorConfig.background.withOpacity(0.0),
              AppColorConfig.background.withOpacity(0.6),
              AppColorConfig.background.withOpacity(1),
            ],
            stops: [0.0, 0.6, 1.0], // Điều chỉnh gradient
          ),
        ),
      ),
    );
  }

  Widget ColumnMovieCard(width, height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(genre, style: GenreTextStyle()),
        SizedBox(height: 20),
        SizedBox(
            height: height *
                (genre == "New release"
                    ? 0.6
                    : 0.25), // Define a height for the horizontal list
            child: Stack(fit: StackFit.expand, children: [
              ListViewMovieCard(width),
              _buildGradientOverlay(height)
            ])),
      ],
    );
  }

  Widget ListViewMovieCard(width) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: datas.length,
      itemBuilder: (context, index) {
        final movie = datas[index];

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: width * 0.2,
          child: MovieCard(
            movieTitle: movie['name'] as String,
            rating: 4,
            type: genre,
            onPressed: () => print(movie['name']),
            poster: (genre == "New release"
                ? movie['poster_url']
                : "https://phimimg.com/${movie['poster_url']}") as String,
          ),
        );
      },
    );
  }

  TextStyle GenreTextStyle() {
    return TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  }
}
