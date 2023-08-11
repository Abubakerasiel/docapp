// ignore: file_names
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/controllers/firebase_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _picker = ImagePicker();

  File? userSelectedImage;

  final storageRef = FirebaseStorage.instance.ref('users_image');

  void createAccount() async {
    if (key.currentState == null || !key.currentState!.validate()) return;
    // if (userSelectedImage == null) {
    //   Get.snackbar('Image Reqired', 'Please select your image');
    //   return;
    // }
    newUser = User();
    newUser!.packageType = selectedPackageType;
    key.currentState!.save();

    log('email: ${newUser!.email} , password : $password');
    //. Create Account
    final response = await FirebaseRepoImpl.instance
        .signUP(email: newUser!.email!, password: password!);
    if (response?.user == null) return;
    //.Upload User Picture
    // final getImageUrl = await uploadImage(
    //     filenName: response!.user!.uid, file: userSelectedImage!);

    // //. modify local user to add user_id , user_image_url
    // log('$getImageUrl');
    // log('${response.user!.email}');
    // newUser!.image = getImageUrl;
    newUser!.id = response!.user!.uid;
    //. store all user date in FireStore Database

    storeUserData(newUser!);
    Get.offAll(const SignInScreen1(),
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

  Future<File?> pickImage() async {
    final selected = await _picker.pickImage(source: ImageSource.gallery);
    if (selected == null) return null;
    return File(selected.path);
  }

  Future<String?> uploadImage(
      {required String filenName, required File file}) async {
    final filePath = storageRef.child(filenName);
    try {
      await filePath.putFile(file);
      return await filePath.getDownloadURL();
    } on FirebaseException catch (err) {
      Get.snackbar('Firebase Error', err.message.toString());
    } catch (err) {
      log(err.toString());
    }
    return null;
  }
}
