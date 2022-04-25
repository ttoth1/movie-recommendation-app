import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/secrets/secrets.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie_recommendation_app/widgets/trending.dart';

class Description extends StatefulWidget {
  final String name, description, bannerURL, posterURL, vote, launchOn;
  final int id;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerURL,
      required this.posterURL,
      required this.vote,
      required this.launchOn,
      required this.id})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  List actors = [];
  final String apiKey = mySecretKey;
  final String readAccessToken = myToken;
  List actorsList = [];
  @override
  void initState() {
    loadMovieInfo();
    super.initState();
  }

  loadMovieInfo() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map movieResult = await tmdbWithCustomLogs.v3.movies.getCredits(widget.id);
    setState(() {
      print('actors below');
      actors = movieResult['cast'];
      for (var item in actors) {
        actorsList.add(item['name']);
      }
    });
    print(actorsList);
    // print(actors[0]['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.name),
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
                      widget.bannerURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    ' Average Rating - ' + widget.vote + ' ⭐',
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
            child: Text('Release date: ' + widget.launchOn),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(widget.posterURL),
              ),
              Flexible(child: Text(widget.description)),
            ],
          ),
          Text("Actors:"),
          Text(actorsList.toString()),
          Text("movie id: " + widget.id.toString()),
        ],
      ),
    );
  }
}
