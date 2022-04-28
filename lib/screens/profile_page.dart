import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/secrets/secrets.dart';
import 'package:movie_recommendation_app/widgets/my_navbar.dart';
import 'package:movie_recommendation_app/widgets/person_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ProfilePage extends StatefulWidget {
  final int personID;
  final String personName;
  const ProfilePage(
      {Key? key, required this.personID, required this.personName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List personMovies = [];
  final String apiKey = mySecretKey;
  final String readAccessToken = myToken;

  @override
  void initState() {
    loadDetails();
    super.initState();
  }

  loadDetails() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map creditsResult =
        await tmdbWithCustomLogs.v3.people.getMovieCredits(widget.personID);
    setState(() {
      print("credits result");
      print(creditsResult);
      personMovies = creditsResult['cast'];
      print('Titles:');
      for (var item in personMovies) {
        print(item['title']);
      }
      // name = detailsResult['title'];
      // description = detailsResult['overview'];
      // bannerURL = imageBaseURL + detailsResult['backdrop_path'];
      // posterURL = imageBaseURL + detailsResult['poster_path'];
      // vote = detailsResult['vote_average'].toString();
      // launchOn = detailsResult['release_date'];
    });
    print('personMovies');
    print(personMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.personName),
      ),
      body: ListView(
        children: [
          PersonMovies(movies: personMovies),
        ],
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
