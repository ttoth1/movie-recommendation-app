import 'package:flutter/material.dart';
// import 'package:movie_recommendation_app/description.dart';
import 'package:movie_recommendation_app/widgets/display_movie_info.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Trending Movies'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayMovieInfo(
                                movieID: trending[index]['id'])));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageBaseURL +
                                    trending[index]['poster_path'])),
                          ),
                        ),
                        Text(trending[index]['title'])
                      ],
                    ),
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
