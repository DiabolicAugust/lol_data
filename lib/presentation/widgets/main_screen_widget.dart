import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lol_data/presentation/pages/wiki_screen_page.dart';

import '../pages/history_screen_page.dart';
import '../pages/homescreen_page.dart';
import '../pages/profile_screen_page.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final options = [
    const HomeScreenPage(),
    const ProfileScreenPage(),
    const HistoryScreenPage(),
    const WikiScreenPage(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        backgroundColor: Colors.amber,
        accentColor: Colors.amber,
        scaffoldBackgroundColor: Colors.amberAccent.shade100
      ),
      home: Scaffold(
        body: options.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          items:  [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              label: 'Home',
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.account_box_rounded,
                color: Colors.white,
              ),
              label: 'Profile',
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.history_rounded,
                color: Colors.white,
              ),
              label: 'History',
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.data_exploration_rounded,
                color: Colors.white,
              ),
              label: 'Wiki',
              backgroundColor: Colors.amber.withOpacity(0.5),
            ),
          ],
          currentIndex: index,
          unselectedLabelStyle: const TextStyle(color: Colors.amber),
          selectedLabelStyle: const TextStyle(color: Colors.amber, ),
          onTap: (int) {
            setState(
              () {
                index = int;
              },
            );
          },
        ),
      ),
    );
  }
}
