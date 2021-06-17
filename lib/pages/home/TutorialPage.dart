import 'package:app2/database/firebase_service.dart';
import 'package:app2/widgets/HeaderDetail.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  final int instrumentId;
  final String instrumentName;
  const TutorialPage({Key key, this.instrumentId, this.instrumentName})
      : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final db = new DB();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: HeaderDetail(
              headerTitle: "Tutorial",
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: ListView(
                children: [
                  Text(
                    "List Video Tutorial " + widget.instrumentName,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  FutureBuilder(
                    future: db.getDataByForeignKey(
                        "tutorials", "fk_instrument", widget.instrumentId),
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
                            if (snapshot.data[0] == null) {
                              List data = [];
                              snapshot.data.forEach((k, v) => data.add(v));
                              print(data);
                              return containerTutorial(data);
                            } else {
                              return containerTutorial(snapshot.data);
                            }
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container containerTutorial(data) {
  return Container(
    margin: EdgeInsets.only(
      top: 16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var item in data)
          Container(
            child: Column(
              children: [
                Text(
                  item["desc"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
