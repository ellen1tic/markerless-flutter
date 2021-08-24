import 'package:app2/pages/Test.dart';
import 'package:app2/pages/home/ARModel.dart';
import 'package:app2/pages/home/Information.dart';
import 'package:app2/pages/home/TutorialPage.dart';
import 'package:app2/widgets/CustomCard.dart';
import 'package:app2/widgets/HeaderDetail.dart';
import 'package:flutter/material.dart';

class DetailInstrument extends StatefulWidget {
  final int instrumentId;
  final String instrumentName;

  DetailInstrument({Key key, this.instrumentId, this.instrumentName})
      : super(key: key);

  @override
  _DetailInstrumentState createState() => _DetailInstrumentState();
}

class _DetailInstrumentState extends State<DetailInstrument> {
  _informasiRoute() {
    // final snackBar = SnackBar(
    //   content: Text("Tampilan Informasi"),
    //   duration: Duration(milliseconds: 2000),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => Information(
          instrumentId: widget.instrumentId,
          instrumentName: widget.instrumentName,
        ),
      ),
    );
  }

  _ar3DRoute() {
    // final snackBar = SnackBar(
    //   content: Text("Menu AR 3D"),
    //   duration: Duration(milliseconds: 2000),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => ARModel(
          instrumentId: widget.instrumentId,
          instrumentName: widget.instrumentName,
        ),
      ),
    );
  }

  _tutorialRoute() {
    print("Tutorial");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => TutorialPage(
          instrumentId: widget.instrumentId,
          instrumentName: widget.instrumentName,
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
              headerTitle: widget.instrumentName,
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: [
                CustomCard(
                  text: "Informasi",
                  routes: _informasiRoute,
                ),
                CustomCard(
                  text: "Model 3 Dimensi (AR)",
                  routes: _ar3DRoute,
                ),
                CustomCard(
                  text: "Tutorial Video",
                  routes: _tutorialRoute,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
