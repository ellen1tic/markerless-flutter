import 'package:app2/constants.dart';
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
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              // Color(0xFF81D4FA),
              Color(0xFF1A237E),
            ],
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              // alignment: Alignment.topRight,
              // child: SvgPicture.asset("assets/icons/logobmr.svg"),
              child: SvgPicture.asset("assets/icons/logobmr3.svg"),
            ),
            // SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Alat Musik \n Tradisional Melayu",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
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
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
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
