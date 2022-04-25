import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/screens/home_page.dart';

class Writers extends StatelessWidget {
  final List writers;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const Writers({Key? key, required this.writers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Writers'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: writers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // print('${writers[index]['name']} clicked');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        writers[index]['profile_path'] != null
                            ? Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseURL +
                                          writers[index]['profile_path'])),
                                ),
                              )
                            : Container(
                                height: 200,
                                child: const Text("No photo available"),
                              ),
                        Text(writers[index]['name']),
                        Text('Writer id: ${writers[index]['id']}'),
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
