import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/screens/profile_page.dart';

class Director extends StatelessWidget {
  final int directorID;
  final LinkedHashMap director;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const Director({Key? key, required this.directorID, required this.director})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Director"),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: InkWell(
              onTap: () {
                print('${director['name']} clicked');
                print('${director['id']} clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              personID: director['id'],
                              personName: director['name'],
                            )));
              },
              child: SizedBox(
                width: 140,
                child: Column(
                  children: [
                    director['profile_path'] != null
                        ? Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      imageBaseURL + director['profile_path'])),
                            ),
                          )
                        : Container(
                            height: 200,
                            child: const Text("No photo available"),
                          ),
                    Text(director['name']),
                    // Text('Director id: ${director['id']}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
