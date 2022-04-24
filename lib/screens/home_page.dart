import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/widgets/my_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: const Center(
        child: Text('Show trending movies here!'),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
