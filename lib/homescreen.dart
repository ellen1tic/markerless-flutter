import 'package:app2/layouts/bottomnav.dart';
import 'package:app2/pages/HomePage.dart';
import 'package:app2/pages/AboutPage.dart';
import 'package:app2/pages/PanduanPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void changeIndex(newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  final tabs = <Widget>[
    HomePage(),
    PanduanPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNav(
          currentIndex: currentIndex,
          changeIndexParent: changeIndex,
        ));
  }
}
