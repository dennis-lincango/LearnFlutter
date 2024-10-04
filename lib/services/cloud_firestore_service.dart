import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  final FirebaseFirestore db;

  const CloudFirestoreService(this.db);

  Future<String> add(Map<String, dynamic> data) async {
    // Add a new document with a generated ID
    final document = await db.collection('users').add(data);
    return document.id;
  }
}