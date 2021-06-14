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
  @override
  Widget build(BuildContext context) {
    // padding: const EdgeInsets.all(12.0),
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      // showUnselectedLabels: false,
      fixedColor: Colors.blue,
      iconSize: 24,
      selectedLabelStyle: TextStyle(
        fontFamily: "Poppins",
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Beranda',
          activeIcon: Icon(Icons.home),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books_outlined),
          label: 'Panduan',
          activeIcon: Icon(Icons.library_books),
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'Tentang',
          activeIcon: Icon(Icons.info),
          backgroundColor: Colors.amber,
        ),
      ],
      onTap: (index) {
        widget.changeIndexParent(index);
        setState(() {});
      },
    );
  }
}
