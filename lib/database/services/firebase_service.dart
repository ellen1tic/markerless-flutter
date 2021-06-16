import 'dart:convert';

import 'package:app2/database/model/AboutModel.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class FirebaseDB {
  Future<About> getDataAbout(String collection);
}

class DB implements FirebaseDB {
  static String dbURL =
      "https://markerless-54a49-default-rtdb.asia-southeast1.firebasedatabase.app/";
  static final FirebaseDatabase _firebase =
      FirebaseDatabase(databaseURL: dbURL);
  static var ref = _firebase.reference();

  Future<About> getDataAbout(String collection) async {
    await ref.child(collection).once().then((DataSnapshot ds) {
      // About about = new About();
      // about.fromJson(ds.value);
      // var res = jsonEncode(ds.value);

      // print(res);
    });
    // return ;
  }
}
