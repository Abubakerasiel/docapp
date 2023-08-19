// ignore: file_names
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/controllers/firebase_repo.dart';
import 'package:get/get.dart';

import '../Auth/sigin_screen.dart';
import '../Auth/sigin_up_screen.dart';
import '../Model/User.dart';
import 'firebase_users_data/firebase_data.dart';

class SignUpController extends GetxController {
  PackageType? selectedPackageType;
  GlobalKey<FormState> key = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    newUser = User(); // Initialize newUser object
  }

  User? newUser;
  String? password;

  File? userSelectedImage;

  final storageRef = FirebaseStorage.instance.ref('users_image');

  void createAccount() async {
    if (key.currentState == null || !key.currentState!.validate()) return;

    newUser = User();
    newUser!.packageType = selectedPackageType;
    key.currentState!.save();

    log('email: ${newUser!.email} , password : $password');
    //. Create Account
    final response = await FirebaseRepoImpl.instance
        .signUP(email: newUser!.email!, password: password!);
    if (response?.user == null) return;

    newUser!.id = response!.user!.uid;
    //. store all user date in FireStore Database

    storeUserData(newUser!);
    await Get.snackbar(
      'Successful Creation'.tr,
      'You have successfully Create Your Account'.tr,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
    );

    Get.offAll(() => const SignInScreen1(),
        curve: Curves.easeInOut,
        duration: Duration(seconds: 1),
        transition: Transition.fadeIn);
  }

  void updateSelectedPackageType(PackageType type) {
    selectedPackageType = type;
  }

  storeUserData(User user) async {
    await UsersRepoImpl.instance.addUser(user);
  }
}
