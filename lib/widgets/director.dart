import 'dart:collection';

import 'package:flutter/material.dart';

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
          Text("Director"),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              print('${director['name']} clicked');
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: SizedBox(
              width: 140,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              imageBaseURL + director['profile_path'])),
                    ),
                  ),
                  Text(director['name']),
                  Text('Director id: ${director['id']}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
