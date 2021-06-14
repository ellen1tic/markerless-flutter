import 'package:flutter/material.dart';
import 'package:app2/constants.dart';
import 'package:app2/jenisalatmusik.dart';
import 'package:app2/homescreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it will provide us total height and width of screens

    return SafeArea(
      child: Column(
        children: <Widget>[
          //buat background body
          HomeScreen(),
          SizedBox(height: kDefaultPadding / 6),
          Expanded(
            child: Stack(
              children: <Widget>[
                //ngatur background bawah
                Container(
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    // color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                //membuat imagebox 1
                // jenisAlatMusik(),
                AlatMusik(),
              ],
            ),
          ),
          // BottomNav(),
        ],
      ),
    );
  }
}
