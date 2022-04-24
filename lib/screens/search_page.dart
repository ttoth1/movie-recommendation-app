import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/widgets/my_navbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Search'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Add movie search here!'),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
