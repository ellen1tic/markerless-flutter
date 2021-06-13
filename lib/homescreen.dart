import 'package:app2/bottomnav.dart';
import 'package:app2/constants.dart';
import 'package:app2/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app2/jenisalatmusik.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(),
          AlatMusik(),
          AlatMusik(),
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
