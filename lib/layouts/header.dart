import 'dart:developer';

import 'package:app2/constants/Teks.dart';
import 'package:app2/constants/Warna.dart';
// import 'package:app2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        decoration: Warna.gradientHeader,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              // child: SvgPicture.asset("assets/icons/logobmr.svg"),
              child: SvgPicture.asset(
                "assets/icons/logobmr3.svg",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.height / 4,
              ),
              alignment: Alignment.bottomCenter,
            ),
            // SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Alat Musik \n Tradisional Melayu",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: Teks.headingStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment:
        //       MainAxisAlignment.center, //atur teks rata tengah untuk Row
        //   children: <Widget>[
        //     Text(
        //       'Alat Musik Tradisional Melayu',
        //       style: Theme.of(context)
        //           .textTheme
        //           .headline5
        //           .copyWith(color: Colors.indigo.shade50),
        //       // fontWeight: FontWeight.bold),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    log(size.toString());
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height + 40, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
    // throw UnimplementedError();
  }
}
