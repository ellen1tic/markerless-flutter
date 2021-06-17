import 'package:app2/constants/Teks.dart';
import 'package:app2/constants/Warna.dart';
// import 'package:app2/constants/constants.dart';
import 'package:flutter/material.dart';

class HeaderDetail extends StatelessWidget {
  final String headerTitle;
  HeaderDetail({this.headerTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: MediaQuery.of(context).size.height,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: EdgeInsets.only(
            // top: 40,
            left: 20,
            right: 20,
          ),
          // height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          decoration: Warna.gradientHeader,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: Container(
                        // margin: EdgeInsets.only(top: 40),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            headerTitle ?? "Judul",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style:
                                Teks.headingStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // log(size.toString());
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height + 40, size.width, size.height - 40);
    // path.lineTo(size.width / 2, size.height - 0);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
    // throw UnimplementedError();
  }
}
