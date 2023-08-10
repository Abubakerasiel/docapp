import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'controllers/firebase_repo.dart';
import 'controllers/firebase_users_data/firebase_data.dart';

class GlobalBindings extends Bindings {
  GlobalBindings() {
    dependencies();
  }

  @override
  void dependencies() {
    Get.lazyPut<FirebaseRepoImpl>(
      () => FirebaseRepoImpl(FirebaseAuth.instance),
      fenix: true,
    );
    Get.lazyPut<UsersRepoImpl>(
      () => UsersRepoImpl(FirebaseFirestore.instance),
      fenix: true,
    );
  }
}
