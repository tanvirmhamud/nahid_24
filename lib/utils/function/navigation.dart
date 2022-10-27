
import 'package:nahid_24/screens/home/home_page.dart';
import 'package:nahid_24/language.dart';
import 'package:nahid_24/screens/auth/login_screen.dart';
import 'package:nahid_24/screens/profile/profile.dart';

import 'package:nahid_24/screens/auth/signup_screen.dart';
import 'package:nahid_24/utils/constants/assets.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../New_Design/Allcourse/allcourse.dart';
import '../../New_Design/Notification/notification.dart';
import '../../New_Design/Search/searchpage.dart';
import '../../New_Design/product/books_screen.dart';

class NavigationScreen extends StatefulWidget {
  int? selectedIndex;
  NavigationScreen({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> screens = [];

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens.elementAt(widget.selectedIndex ?? 0),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreen(),
          BookScreen(),
          // SearchPage(),
          AllcourceVideo(),
          NotificationPage(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              PAssets.bookIcon,
              scale: 16,
            ),
            label: "book",
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
              PAssets.liveChat,
              scale: 16,
            ),
            label: "chat",
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

        onTap: (int index) {
          if (index == 3) {
            redirectToFacebook();
          } else
            pageController.jumpToPage(index);
        },
      ),
    );
  }

  redirectToFacebook() async {
    const url = 'http://m.me/nahid24publications'; // or add your URL here
    if (await canLaunchUrl(Uri.parse(url))) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
