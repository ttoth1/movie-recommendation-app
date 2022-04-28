import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/secrets/secrets.dart';
import 'package:movie_recommendation_app/widgets/my_navbar.dart';
import 'package:movie_recommendation_app/widgets/search.dart';
import 'package:tmdb_api/tmdb_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List movieSearchResults = [];
  final String apiKey = mySecretKey;
  final String readAccessToken = myToken;

  searchMovies(userQuery) async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map searchResult =
        await tmdbWithCustomLogs.v3.search.queryMovies(userQuery);
    if (mounted) {
      setState(() {
        movieSearchResults = searchResult['results'];
        print("movieSearchResults");
        print(movieSearchResults);
      });
    }
    // print('trending');
    // print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Search'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 35.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  hintText: 'Search for a movie',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  print('User searched for ${searchController.text}');
                  searchMovies(searchController.text);
                  // searchMovies('Avengers');
                },
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SearchMovies(searchList: movieSearchResults),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
