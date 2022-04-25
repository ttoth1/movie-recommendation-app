import 'package:flutter/material.dart';

class Director extends StatelessWidget {
  final int directorID;
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  const Director({Key? key, required this.directorID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Director'),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: SizedBox(
              width: 140,
              child: Text("Director ID is $directorID"),
              // child: Column(
              //   children: [
              //     Container(
              //       height: 200,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //             image: NetworkImage(
              //                 imageBaseURL + director['profile_path'])),
              //       ),
              //     ),
              //     Text("Director is $director"),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
