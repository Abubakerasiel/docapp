import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'controllers/FirebaseUsersData/FirebaseData.dart';
import 'controllers/Firebase_Repo.dart';

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
