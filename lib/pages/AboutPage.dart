import 'dart:developer';

import 'package:app2/constants/Warna.dart';
import 'package:app2/database/model/AboutModel.dart';
import 'package:app2/database/services/firebase_service.dart';
import 'package:app2/widgets/HeaderPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  About about = new About();
  AboutPage({Key key, this.about});
  @override
  _AboutPageState createState() => _AboutPageState(about);
}

class _AboutPageState extends State<AboutPage> {
  final _reference = DB.ref;
  String URL =
      "https://lh3.googleusercontent.com/kHFOZ87n1nbxwDgtGLR9rRHsCooB9Dg4QT3O3lEXSqIbBGifZ5tIdYZnmTb4zJyPuPpGEHXm7UZxSYyMuQ=w1080-h608-p-no-v0";
  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum lorem nulla, ut ultrices nulla lacinia a. Vivamus posuere neque quis augue interdum congue. Nunc tempor commodo dolor, nec pulvinar mi. Ut justo libero, commodo ac lacus sed, tincidunt aliquam odio. Sed ullamcorper, purus vel molestie rutrum, metus sem tempus arcu, consectetur eleifend felis purus vel elit. Donec nisi massa, consequat ac sem quis, fermentum posuere odio. Proin viverra lacus vitae felis viverra, id ultrices nulla finibus. Proin eget porttitor risus, eget euismod mi. Cras ut odio dapibus, convallis magna ultrices, tempus justo. Integer a ex mi. Aenean quis dui ut eros dictum tincidunt. Cras iaculis dolor felis. Maecenas blandit felis quis risus interdum eleifend. Fusce ornare fringilla sapien nec semper. Nunc pharetra turpis nulla, ac pretium magna rutrum a.";

  String address = "Jl Garuda Gg Pelita No 15";
  String telp = "0877 - 1606 - 2764";

  About about;

  _AboutPageState(this.about);

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
          child: new FirebaseAnimatedList(
            query: _reference.child("about"),
            itemBuilder: (BuildContext context, DataSnapshot ds,
                Animation<double> animation, int index) {
              print(ds.value);
              // return Text(ds.value["img"].toString());
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
                          image: NetworkImage(ds.value['img']),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        ds.value["ket"].toString(),
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    CardAbout(
                      icon: Icons.pin_drop,
                      text: ds.value["address"],
                    ),
                    CardAbout(
                      icon: Icons.phone,
                      text: ds.value["telp"],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // Flexible(
        //   flex: 3,
        //   child: Container(
        //     padding: EdgeInsets.only(left: 16, right: 16),
        //     // color: Colors.red,
        //     width: MediaQuery.of(context).size.width,
        //     child: Column(
        //       children: [
        //         Expanded(
        //           child: ListView(
        //             children: [
        //               Container(
        //                 margin: EdgeInsets.only(bottom: 16, top: 0),
        //                 child: ClipRRect(
        //                   borderRadius: BorderRadius.circular(10),
        //                   child: Image(
        //                     image: NetworkImage(URL),
        //                   ),
        //                 ),
        //               ),
        //               Container(
        //                 margin: EdgeInsets.only(bottom: 16),
        //                 child: Text(
        //                   text,
        //                   style: TextStyle(fontSize: 18),
        //                   textAlign: TextAlign.justify,
        //                 ),
        //               ),
        //               CardAbout(
        //                 icon: Icons.pin_drop,
        //                 text: address,
        //               ),
        //               CardAbout(
        //                 icon: Icons.phone,
        //                 text: telp,
        //               ),
        //               ElevatedButton(
        //                 onPressed: () async {
        //                   DB db = new DB();
        //                   var data = await db.getDataAbout("about");
        //                   print(data);
        //                 },
        //                 child: Text("Buton"),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
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
