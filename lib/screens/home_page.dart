import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/widgets/my_navbar.dart';
import 'package:movie_recommendation_app/secrets/secrets.dart';
import 'package:movie_recommendation_app/widgets/top_rated.dart';
import 'package:movie_recommendation_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  final String apiKey = mySecretKey;
  final String readAccessToken = myToken;

  @override
  void initState() {
    loadMovies();
    loadTopMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending
        .getTrending(mediaType: MediaType.movie);
    if (mounted) {
      setState(() {
        trendingMovies = trendingResult['results'];
      });
    }
    print('trending');
    print(trendingMovies);
  }

  loadTopMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map topResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    if (mounted) {
      setState(() {
        topRatedMovies = topResult['results'];
      });
    }
    print('topRatedMovies');
    print(topRatedMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
          TopRated(topRated: topRatedMovies),
        ],
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
