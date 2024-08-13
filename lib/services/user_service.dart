import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_manager/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<List<UserModel>> getUsers() async {
    QuerySnapshot snapshot = await _firestore.collection('users').get();

    print(
        "Documents fetched: ${snapshot.docs.length}"); // Log the number of documents fetched

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>?;

      print("Document data: $data"); // Log the document data

      if (data != null) {
        return UserModel.fromJson(data);
      } else {
        throw Exception('Document data is null');
      }
    }).toList();
  }

  Future<void> addUser(UserModel user) async {
    await _firestore.collection('users').add(user.toJson());
  }
}
