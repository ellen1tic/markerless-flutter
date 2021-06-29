import 'package:app2/database/firebase_service.dart';
import 'package:app2/widgets/HeaderPage.dart';
import 'package:flutter/material.dart';

class PanduanPage extends StatefulWidget {
  @override
  _PanduanPageState createState() => _PanduanPageState();
}

class _PanduanPageState extends State<PanduanPage> {
  final db = new DB();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: HeaderPage(
            headerText: "Panduan Penggunaan \nAplikasi",
          ),
        ),
        Flexible(
          flex: 3,
          child: ListView(children: [
            FutureBuilder(
              future: db.getData("panduan"),
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
                    // print(snapshot.data);
                    if (snapshot.hasData) {
                      return panduanContainer(snapshot.data, size);
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
                    // return Text("Hai");
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
          ]),
        ),
      ],
    );
  }
}

Container panduanContainer(data, size) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    padding: EdgeInsets.only(left: 16, right: 16),
    alignment: Alignment.bottomLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var item in data)
          Container(
            margin: EdgeInsets.only(bottom: 16),
            // width: size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["no"].toString() + ".",
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: size.width / 1.2,
                      child: Text(
                        item["title"],
                        softWrap: true,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(item['img']),
                    ),
                  ),
                )
              ],
            ),
          ),
      ],
    ),
  );
}
