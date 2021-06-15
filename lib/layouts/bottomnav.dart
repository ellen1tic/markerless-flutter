// import 'package:app2/constants/Warna.dart';
import 'dart:developer';

import 'package:app2/constants/Warna.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  final changeIndexParent;

  BottomNav({Key key, this.currentIndex, this.changeIndexParent});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNav> {
  // var bottomNav =

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Warna.biruGelap.withOpacity(0.2),
            spreadRadius: -5,
            blurRadius: 10,
            offset: Offset(0, -5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          buildBottomNavItems(
              context, Icons.house_outlined, Icons.house, "Home", 0),
          buildBottomNavItems(context, Icons.library_books_outlined,
              Icons.library_books, "Panduan", 1),
          buildBottomNavItems(
              context, Icons.info_outline, Icons.info, "Tentang", 2),
        ],
      ),
    );
    // return BottomNavigationBar(
    //   currentIndex: widget.currentIndex,
    //   // type: BottomNavigationBarType.shifting,
    //   showSelectedLabels: true,
    //   // showUnselectedLabels: false,
    //   unselectedItemColor: Colors.grey,
    //   fixedColor: Colors.blue,
    //   // selectedIconTheme: IconThemeData(),
    //   iconSize: 24,
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home_outlined),
    //       label: 'Beranda',
    //       activeIcon: Icon(Icons.home),
    //       // backgroundColor: Colors.blue,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.library_books_outlined),
    //       label: 'Panduan',
    //       activeIcon: Icon(Icons.library_books),
    //       // backgroundColor: Colors.red,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.info_outline),
    //       label: 'Tentang',
    //       activeIcon: Icon(Icons.info),
    //       // backgroundColor: Colors.amber,
    //     ),
    //   ],
    //   onTap: (index) {
    //     widget.changeIndexParent(index);
    //     setState(() {});
    //   },
    // );
  }

  Widget buildBottomNavItems(BuildContext context, IconData icon,
      IconData iconActive, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.changeIndexParent(index);
      },
      child: Container(
        // padding: EdgeInsets.all(8),
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        // color: Colors.white,
        decoration: widget.currentIndex == index
            ? BoxDecoration(
                color: Warna.biruLangit,
              )
            : BoxDecoration(
                color: Colors.white,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                // width: MediaQuery.of(context).size.width / 4,
                // padding: EdgeInsets.all(4),

                child: Column(
              children: [
                Container(
                  // color: widget.currentIndex == index ? Warna.biru : Colors.grey,
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    widget.currentIndex == index ? iconActive : icon,
                    color: widget.currentIndex == index
                        ? Warna.biruGelap
                        : Colors.grey,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: widget.currentIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: widget.currentIndex == index
                        ? Warna.biruGelap
                        : Colors.grey,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
