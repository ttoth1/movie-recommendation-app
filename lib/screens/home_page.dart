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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/search');
              },
              child: const Text('Search screen'),
            ),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/saved');
              },
              child: const Text('Saved screen'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
