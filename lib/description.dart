import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerURL, posterURL, vote, launchOn;
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerURL,
      required this.posterURL,
      required this.vote,
      required this.launchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
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
              padding: const EdgeInsets.all(10),
              child: Text(name),
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
          ],
        ),
      ),
    );
  }
}
