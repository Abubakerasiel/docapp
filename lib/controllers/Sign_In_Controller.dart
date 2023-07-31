import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart%20';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/home.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/User.dart';

import 'Firebase_Repo.dart';

class SignInController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    onFirstTimeSignIn();

    // await notificationService.initNotification();

    // sendAllUsersNotfication(userToken!, 'hi', 'hello');
  }

  GlobalKey<FormState> key = GlobalKey();
  User? newUser;
  String? email;
  String? password;
  String? userToken;

  Future<String?> getUserToken() async {
    String? token;
    try {
      // Request for the user's token
      token = await FirebaseMessaging.instance.getToken();
      userToken = token;
    } catch (e) {
      print('Error getting user token: $e');
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
      // Your code to execute only on the first-time sign-in
      // For example, showing a welcome message, initializing user preferences, etc.

      // Mark the first-time sign-in as false for future references
      await prefs.setBool('isFirstTimeSignIn', false);
    }

    // Continue with the rest of your sign-in logic here...
  }

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
