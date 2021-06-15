import 'package:app2/constants/Teks.dart';
import 'package:app2/constants/Warna.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatefulWidget {
  final String headerText;

  HeaderPage({Key key, this.headerText});
  @override
  _HeaderPageState createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
      decoration: Warna.gradientHeader,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.headerText,
              style: Teks.headingStyle.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
