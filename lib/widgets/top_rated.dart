import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/widgets/display_movie_info.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const TopRated({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Top Rated Movies'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayMovieInfo(
                                movieID: topRated[index]['id'])));
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
                                    topRated[index]['poster_path'])),
                          ),
                        ),
                        Text(topRated[index]['title'])
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
