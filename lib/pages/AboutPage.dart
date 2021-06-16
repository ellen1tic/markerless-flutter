import 'dart:developer';

import 'package:app2/constants/Warna.dart';
import 'package:app2/database/firebase_service.dart';
import 'package:app2/widgets/HeaderPage.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({
    Key key,
  });
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final db = new DB();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: HeaderPage(
            headerText: "Tentang Kami",
          ),
        ),
        Flexible(
          flex: 3,
          child: ListView(children: [
            FutureBuilder(
              future: db.getData("about"),
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
                      return AboutContainer(snapshot.data[0]);
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
          ]),
        ),
      ],
    );
  }
}

class AboutContainer extends StatelessWidget {
  final ds;

  AboutContainer(this.ds);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(ds['img']),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              ds["ket"].toString(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ),
          CardAbout(
            icon: Icons.pin_drop,
            text: ds["address"],
          ),
          CardAbout(
            icon: Icons.phone,
            text: ds["telp"],
          ),
        ],
      ),
    );
  }
}

class CardAbout extends StatelessWidget {
  final IconData icon;
  final String text;
  const CardAbout({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Warna.biruGelap.withOpacity(0.2),
            spreadRadius: -5,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
        color: Colors.white,
        border: Border.all(
          width: 0,
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            // color: Warna.biru,
            // decoration: Warna.gradientHeader.copyWith(
            //   borderRadius: BorderRadius.circular(10),
            // ),
            child: Icon(
              icon,
              size: 24,
              color: Warna.biru,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
