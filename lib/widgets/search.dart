import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/widgets/display_movie_info.dart';

class SearchMovies extends StatelessWidget {
  final List searchList;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const SearchMovies({Key? key, required this.searchList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // const Text('Movie Search Results'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayMovieInfo(
                                movieID: searchList[index]['id'])));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        searchList[index]['poster_path'] != null
                            ? Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseURL +
                                          searchList[index]['poster_path'])),
                                ),
                              )
                            : Container(
                                height: 200,
                                child: const Text("No photo available"),
                              ),
                        Text(searchList[index]['title'])
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
