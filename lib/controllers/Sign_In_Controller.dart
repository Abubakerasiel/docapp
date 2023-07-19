import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/home.dart';

import 'package:get/get.dart';
import '../Model/User.dart';

import 'Firebase_Repo.dart';

class SignInController extends GetxController {
  GlobalKey<FormState> key = GlobalKey();
  User? newUser;
  String? email;
  String? password;

  void signIn() async {
    if (key.currentState == null || !key.currentState!.validate()) return;

    key.currentState!.save();

    log('email: $email , password : $password');
    final response = await FirebaseRepoImpl.instance
        .signIn(email: email!, password: password!);
    if (response == null) return;
    log('${response.user?.email}');
    Get.to(HomeScreen1());
  }
}
