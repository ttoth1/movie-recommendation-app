import 'package:flutter/material.dart';
// import 'package:movie_recommendation_app/description.dart';
import 'package:movie_recommendation_app/widgets/display_movie_info.dart';

class PersonMovies extends StatelessWidget {
  final List movies;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const PersonMovies({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Movies'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayMovieInfo(
                                movieID: movies[index]['id'])));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        movies[index]['poster_path'] != null
                            ? Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseURL +
                                          movies[index]['poster_path'])),
                                ),
                              )
                            : Container(
                                height: 200,
                                child: const Text("No photo available"),
                              ),
                        Text(
                            movies[index]['title'] ?? 'error retrieving title'),
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
