import 'package:flutter/material.dart';

import '../header.dart';
import '../jenisalatmusik.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header(),
        AlatMusik(),
        AlatMusik(),
      ],
    );
  }
}
