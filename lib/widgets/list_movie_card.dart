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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            genre,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: height * 0.6, // Define a height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: datas.length,
              itemBuilder: (context, index) {
                final movie = datas[index];

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: width * 0.2,
                  child: MovieCard(
                    movieTitle: movie['name'] as String,
                    rating: 4,
                    type: genre,
                    onPressed: () => print(movie['title']),
                    poster: movie['poster_url'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
