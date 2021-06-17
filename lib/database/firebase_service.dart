import 'package:firebase_database/firebase_database.dart';

abstract class FirebaseDB {
  Future getData(String collection);
  Future getDataByForeignKey(String collection, String field, int where);
}

class DB implements FirebaseDB {
  static String dbURL =
      "https://markerless-54a49-default-rtdb.asia-southeast1.firebasedatabase.app/";
  static final FirebaseDatabase _firebase =
      FirebaseDatabase(databaseURL: dbURL);
  static var ref = _firebase.reference();

  Future getData(String collection) async {
    var data = await ref.child(collection).once();
    return data.value;
    // return ;
  }

  Future getDataByForeignKey(String collection, String field, int where) async {
    var data =
        await ref.child(collection).orderByChild(field).equalTo(where).once();

    return data.value;
  }
}
