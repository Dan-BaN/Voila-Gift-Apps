import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAPI {
  static Stream<QuerySnapshot> playerStream =
  Firestore.instance.collection('deliverydetails').snapshots();

  static CollectionReference reference =
  Firestore.instance.collection('deliverydetails');
}