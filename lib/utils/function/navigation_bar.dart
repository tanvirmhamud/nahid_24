import 'package:flutter/material.dart';

import '../constants/assets.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        // BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        // BottomNavigationBarItem(icon: Icon(Icons.person),label: "person"),
        BottomNavigationBarItem(
          icon: Image.asset(
            PAssets.homeIcon,
            scale: 16,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            PAssets.serachIcon,
            scale: 16,
          ),
          label: "search",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            PAssets.playCircleIcon,
            scale: 16,
          ),
          label: "play_circle",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            PAssets.bookIcon,
            scale: 16,
          ),
          label: "book",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            PAssets.ringIcon,
            scale: 16,
          ),
          label: "ring",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            PAssets.personIcon,
            scale: 16,
          ),
          label: "person",
        ),
      ],

      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      backgroundColor: Colors.white,
      // selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      // selectedIconTheme: IconThemeData(
      //   color: Colors.redAccent
      // ),
    );
  }
}
