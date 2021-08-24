import 'package:app2/database/firebase_service.dart';
import 'package:app2/widgets/HeaderDetail.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  final int instrumentId;
  final String instrumentName;
  const Information({Key key, this.instrumentId, this.instrumentName})
      : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final db = new DB();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Flexible(
          flex: 1,
          child: HeaderDetail(
            headerTitle: "Informasi\n" + widget.instrumentName,
          ),
        ),
        Flexible(
          flex: 3,
          child: ListView(
            shrinkWrap: true,
            children: [
              FutureBuilder(
                future: db.getDataByForeignKey(
                    "information",
                    "fk_instrument",
                    widget
                        .instrumentId), //Future getDataByForeignKey(String collection, String field, int where)
                builder: (context, snapshot) {
                  print(snapshot.data);
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
                          return containerInfo(data, db, size);
                        } else {
                          return containerInfo(snapshot.data, db, size);
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
              )
            ],
          ),
        )
      ],
    ));
  }
}

Container containerInfo(data, db, size) {
  return Container(
    margin: EdgeInsets.only(top: 8),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        for (var item in data)
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      item["no"].toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      item["title"].toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    item["text"],
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                FutureBuilder(
                  future: db.getDataByForeignKey(
                      "img_information",
                      "fk_information",
                      item[
                          "id"]), //mengambil pada fieldd fk_information kemudian ambil id nya
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
                            return containerImage(data, size);
                          } else {
                            return containerImage(snapshot.data, size);
                          }
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "",
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
                                "",
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
          )
      ],
    ),
  );
}

Container containerImage(data, size) {
  //nampilin banyak gambar
  return Container(
    width: double.infinity,
    // height: 400,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var item in data)
            Container(
              padding: EdgeInsets.all(4),
              child: Image(
                image: NetworkImage(item["url"]),
                height: 200,
                // width: size.width / 1.3,
                fit: BoxFit.cover,
              ),
            )
        ],
      ),
    ),
  );
}
