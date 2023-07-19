import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Model/User.dart';

abstract class UsersRepo {
  Future<List<User>?> getAllUsers();
  Future<User?> getSingleUser(String uid);
  Future<String?> addUser(User user);
}

class UsersRepoImpl implements UsersRepo {
  static UsersRepoImpl get instance =>
      Get.put(UsersRepoImpl(FirebaseFirestore.instance));

  final FirebaseFirestore db;

  UsersRepoImpl(this.db);

  // ignore: body_might_complete_normally_nullable
  @override
  Future<String?> addUser(User user) async {
    final newUserDoc = db.collection('users').doc(user.id);
    await newUserDoc.set(user.toJson());
    return null;
  }

  @override
  Future<List<User>?> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<User?> getSingleUser(String uid) {
    // TODO: implement getSingleUser
    throw UnimplementedError();
  }
}
