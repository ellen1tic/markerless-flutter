import 'package:app2/homescreen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class BottomNav extends StatefulWidget {
  int currentIndex = 0;
  final changeIndexParent;

  BottomNav({Key key, this.currentIndex, this.changeIndexParent});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNav> {
  final tabs = <Widget>[
    HomeScreen(),
    Text("Hai"),
  ];
  @override
  Widget build(BuildContext context) {
    // padding: const EdgeInsets.all(12.0),
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Beranda',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books_rounded),
          label: 'Panduan',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_rounded),
          label: 'Tentang',
          backgroundColor: Colors.amber,
        ),
      ],
      onTap: (index) {
        widget.changeIndexParent(index);
        setState(() {});
      },
    );
//   }
// }

// }import 'package:flutter/material.dart';

    // return Container(
    //   padding: EdgeInsets.only(
    //     left: kDefaultPadding * 2,
    //     right: kDefaultPadding * 2,
    //     bottom: kDefaultPadding,
    //   ),
    //   height: 80,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         offset: Offset(0, -10),
    //         blurRadius: 35,
    //         color: kPrimaryColor.withOpacity(0.38),
    //       ),
    //     ],
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       IconButton(
    //         icon: SvgPicture.asset("assets/icons/beranda.svg"),
    //         onPressed: () {},
    //       ),
    //       IconButton(
    //         icon: SvgPicture.asset("assets/icons/panduan.svg"),
    //         onPressed: () {},
    //       ),
    //       IconButton(
    //         icon: SvgPicture.asset("assets/icons/tentang.svg"),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    // );
  }
}
