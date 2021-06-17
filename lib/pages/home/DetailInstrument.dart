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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.instrumentName ?? "Tidak ada data"),
      ),
    );
  }
}
