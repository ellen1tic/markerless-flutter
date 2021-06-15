import 'package:app2/widgets/HeaderPage.dart';
import 'package:flutter/material.dart';

class PanduanPage extends StatefulWidget {
  @override
  _PanduanPageState createState() => _PanduanPageState();
}

class _PanduanPageState extends State<PanduanPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: HeaderPage(
            headerText: "Panduan",
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [Text("Panduan")],
            ),
          ),
        ),
      ],
    );
  }
}
