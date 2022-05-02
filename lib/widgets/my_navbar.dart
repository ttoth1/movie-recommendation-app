import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/screens/home_page.dart';
import 'package:movie_recommendation_app/screens/saved_page.dart';
import 'package:movie_recommendation_app/screens/search_page.dart';
import 'package:movie_recommendation_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return BottomNavigationBar(
      selectedItemColor: Colors.grey.shade600,
      unselectedItemColor: Colors.grey.shade600,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      type: BottomNavigationBarType.fixed,
      onTap: (index) async {
        if (index == 0) {
          print("show home screen");
          Navigator.popUntil(context, ModalRoute.withName('/'));
        } else if (index == 1) {
          print("show search screen");
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SearchPage()));
        } else if (index == 2) {
          print("Trying to logout");
          await authService.signOut();
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_search),
          label: ("Search"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: ("Logout"),
        ),
      ],
    );
  }
}
