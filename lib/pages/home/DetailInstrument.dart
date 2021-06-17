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
    print("Information");
  }

  _ar3DRoute() {
    print("AR 3D");
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
                  text: "Animasi 3D (AR)",
                  routes: _ar3DRoute,
                ),
                CustomCard(
                  text: "Tutorial",
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
