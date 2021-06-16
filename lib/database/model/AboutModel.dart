// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class About {
  String key;
  String ket;
  String img;
  final String table = "about";

  About({this.key, this.ket, this.img});

  void readData() {
    final dbReference = FirebaseDatabase(
        databaseURL:
            "https://markerless-54a49-default-rtdb.asia-southeast1.firebasedatabase.app/");
    final ref = dbReference.reference();

    ref.once().then((ds) {
      print(ds);
    });
  }

  fromJson(Map<String, dynamic> json) {
    return About(
      key: json['key'],
      ket: json['ket'],
      img: json['img'],
    );
  }
}
