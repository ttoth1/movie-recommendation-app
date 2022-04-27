import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/secrets/secrets.dart';
import 'package:movie_recommendation_app/widgets/actors.dart';
import 'package:movie_recommendation_app/widgets/director.dart';
import 'package:movie_recommendation_app/widgets/writers.dart';
import 'package:tmdb_api/tmdb_api.dart';

class DisplayMovieInfo extends StatefulWidget {
  final int movieID;
  const DisplayMovieInfo({Key? key, required this.movieID}) : super(key: key);

  @override
  State<DisplayMovieInfo> createState() => _DisplayMovieInfoState();
}

class _DisplayMovieInfoState extends State<DisplayMovieInfo> {
  final String apiKey = mySecretKey;
  final String readAccessToken = myToken;
  List movieDetails = [];
  List cast = [];
  List crew = [];
  late int directorID = 0;
  late LinkedHashMap director = {'': 0, 'a': 0} as LinkedHashMap;
  List writers = [];
  List writerIDs = [];
  final String imageBaseURL = 'https://image.tmdb.org/t/p/w500';

  late String name = '',
      description = '',
      bannerURL = '',
      posterURL = '',
      vote = '',
      launchOn = '';

  @override
  void initState() {
    loadDetails();
    loadCast();
    super.initState();
  }

  loadDetails() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map detailsResult =
        await tmdbWithCustomLogs.v3.movies.getDetails(widget.movieID);
    setState(() {
      name = detailsResult['title'];
      description = detailsResult['overview'];
      bannerURL = imageBaseURL + detailsResult['backdrop_path'];
      posterURL = imageBaseURL + detailsResult['poster_path'];
      vote = detailsResult['vote_average'].toString();
      launchOn = detailsResult['release_date'];
    });
    // print("detailsResult");
    // print(detailsResult);
    // print(name);
  }

  loadCast() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map creditsResult =
        await tmdbWithCustomLogs.v3.movies.getCredits(widget.movieID);
    setState(() {
      cast = creditsResult['cast'];
      crew = creditsResult['crew'];
      // print("cast type is ${cast.runtimeType}");
      for (var item in crew) {
        if (item['job'] == 'Director') {
          directorID = item['id'];
          print('movie director is ' + item['name']);
          print('movie director ID ' + item['id'].toString());
          // print("id type is ${item['id'].runtimeType}");
          // print("item name type is ${item['name'].runtimeType}");
          // print(item);
          // print("item type is ${item.runtimeType}");
          director = item;
          // print("director type is ${director.runtimeType}");

          // } else if ((item['department'] == 'Writing') &&
          //     !writers.contains(item['id'])) {

        } else if ((item['department'] == 'Writing') &&
            (!writerIDs.contains(item['id']))) {
          print('item is $item');
          print(item.runtimeType);
          print('item id is ${item['id']}');
          print(item['id'].runtimeType);

          print('Item keys: ${item.keys}');
          print('Item values: ${item.values}');

          print(
              'Item values contains id 1223895: ${item.values.contains(1223895)}');

          print('writer is ${item['name']} with id ${item['id']}');
          print(
              'writerIDs already contains ${item['id']}? ${writerIDs.contains(item['id'])}');
          if (writerIDs.contains(item['id'])) {
            print('writerID already added');
          }
          // print(
          //     'writers already contains this name? ${writers.contains(item)}');
          writers.add(item);
          print('writer ${item['name']} added');
          writerIDs.add(item['id']);
          print('writerID ${item['id']} added');
          print('writerIDs: $writerIDs');
        }
        // print('writers is now: $writers');
      }
    });
    print("complete writers: $writers");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    ' Average Rating - ' + vote + ' ⭐',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Release date: ' + launchOn),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterURL),
              ),
              Flexible(child: Text(description)),
            ],
          ),
          Text(" Movie id: " + widget.movieID.toString()),
          Actors(actors: cast),
          Director(
            directorID: directorID,
            director: director,
          ),
          Writers(writers: writers),
        ],
      ),
    );
  }
}
