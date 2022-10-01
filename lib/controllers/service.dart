import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/customer-model.dart';

class ServiceAPI {

  static Future<List< CustomerModel>> retrieveEmployees() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await  FirebaseFirestore.instance
        .collection("table-customer").get();
    return snapshot.docs
        .map((docSnapshot) =>  CustomerModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}