import 'package:app2/database/firebase_service.dart';
import 'package:flutter/material.dart';

import '../../layouts/header.dart';
import '../../widgets/CardAlatMusik.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = new DB();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Header(),
        ),
        Flexible(
          flex: 2,
          child: ListView(
            children: [
              FutureBuilder(
                future: db.getData("instruments"),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text("Loading ...")
                          ],
                        ),
                      );
                      break;
                    case ConnectionState.none:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tidak ada data ...",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        return containerAlatMusik(snapshot.data);
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tidak ada data ...",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      break;
                    default:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tidak ada data ...",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      );
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

Container containerAlatMusik(instruments) {
  return Container(
    child: Column(
      children: [
        for (var instrument in instruments)
          AlatMusik(
            id: instrument['id'],
            img: instrument['img'],
            name: instrument['name'],
          ),
      ],
    ),
  );
}
