// ignore: file_names
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/home.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/User.dart';

import 'firebase_repo.dart';

class SignInController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    onFirstTimeSignIn();
  }

  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  User? newUser;
  String? email;
  String? password;
  String? userToken;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<String?> getUserToken() async {
    String? token;
    try {
      // Request for the user's token
      token = await FirebaseMessaging.instance.getToken();
      userToken = token;
    } catch (e) {
      log('Error getting user token: $e');
    }
    return token;
  }

  void saveToken() async {
    await FirebaseFirestore.instance
        .collection('UserTokes')
        .doc()
        .set({'token': userToken});
  }

  Future<void> onFirstTimeSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isFirstTimeSignIn = prefs.getBool('isFirstTimeSignIn') ?? true;

    if (isFirstTimeSignIn) {
      await getUserToken();
      saveToken();

      await prefs.setBool('isFirstTimeSignIn', false);
    }

    // Continue with the rest of your sign-in logic here...
  }

  void signIn() async {
    if (key1.currentState == null || !key1.currentState!.validate()) return;

    key1.currentState!.save();

    log('email: $email , password : $password');
    final response = await FirebaseRepoImpl.instance
        .signIn(email: email!, password: password!);
    if (response == null) return;
    log('${response.user?.email}');
    Get.to(const HomeScreen1(),
        curve: Curves.easeInOut,
        duration: Duration(seconds: 1),
        transition: Transition.fadeIn);
    emailController.clear();
    passwordController.clear();
  }
}
