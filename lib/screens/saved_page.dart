import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/widgets/my_navbar.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Movies'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Add saved movies here!'),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
