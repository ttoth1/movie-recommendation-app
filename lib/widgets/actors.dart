import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/description.dart';
import 'package:movie_recommendation_app/screens/home_page.dart';

class Actors extends StatelessWidget {
  final List actors;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const Actors({Key? key, required this.actors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Actors'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actors.length.clamp(0, 6),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print('${actors[index]['name']} clicked');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePage()));
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
                                    actors[index]['profile_path'])),
                          ),
                        ),
                        Text(actors[index]['name']),
                        Text(actors[index]['character']),
                        Text('Actor id: ${actors[index]['id']}'),
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
