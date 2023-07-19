import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class FirebaseRepo {
  User? get currentUser;
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  });
  Future<UserCredential?> signUP({
    required String email,
    required String password,
  });

  Future<bool> logOut();
}

class FirebaseRepoImpl implements FirebaseRepo {
  static FirebaseRepoImpl get instance =>
      Get.put(FirebaseRepoImpl(FirebaseAuth.instance));

  final FirebaseAuth auth;

  FirebaseRepoImpl(this.auth);

  @override
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userResponse = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userResponse.user == null) return null;

      log(userResponse.user!.uid);
      return userResponse;
    } on FirebaseAuthException catch (err) {
      log(err.code);
      Get.snackbar('Firebase Auth Error', err.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (err) {
      Get.snackbar('Error', err.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  @override
  Future<bool> logOut() async {
    try {
      await auth.signOut();
      return true;
    } on FirebaseAuthException catch (err) {
      log(err.code);
      Get.snackbar('Firebase Auth Error', err.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (err) {
      Get.snackbar('Error', err.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return false;
  }

  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<UserCredential?> signUP(
      {required String email, required String password}) async {
    try {
      final userResponse = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userResponse.user == null) return null;

      log(userResponse.user!.uid);
      return userResponse;
    } on FirebaseAuthException catch (err) {
      log(err.code);
      Get.snackbar('Firebase Auth Error', err.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (err) {
      Get.snackbar('Error', err.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
