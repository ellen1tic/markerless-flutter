import 'package:app2/pages/Test.dart';
import 'package:app2/widgets/CustomCard.dart';
import 'package:app2/widgets/HeaderDetail.dart';
import 'package:flutter/material.dart';

class ARModel extends StatefulWidget {
  final int instrumentId;
  final String instrumentName;
  const ARModel({Key key, this.instrumentId, this.instrumentName})
      : super(key: key);

  @override
  _ARModelState createState() => _ARModelState();
}

class _ARModelState extends State<ARModel> {
  _anatomiRoute(String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => Test(
          instrumentName: widget.instrumentName,
          instrumentType: type,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: HeaderDetail(
              headerTitle: "Model 3 Dimensi (AR)\n" + widget.instrumentName,
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.
              children: [
                CustomCard(
                  text: "Anatomi",
                  routes: () => _anatomiRoute("Anatomi"),
                ),
                CustomCard(
                  text: "Posisi dan Cara Main",
                  routes: () => _anatomiRoute("Animasi"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
