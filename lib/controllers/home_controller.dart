import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Auth/sigin_screen.dart';

import 'package:get/get.dart';

import '../Model/User.dart';
import 'booking_controller.dart';
import 'firebase_repo.dart';

CollectionReference waitingListCollection =
    FirebaseFirestore.instance.collection('waiting_list');

final usersRef = FirebaseFirestore.instance.collection('users');
CollectionReference datesCollection =
    FirebaseFirestore.instance.collection('dates');

class HomeController extends GetxController {
  ReservationController controller = ReservationController();
  static HomeController get instance => Get.find();

  List<User>? users;
  final usersLisnter = <User>[].obs;
  List? dates;
  final datesLisnter = [].obs;

  Stream streamSubscription = usersRef.snapshots();
  Stream streamSubscription1 = datesCollection.snapshots();

  @override
  void onInit() {
    super.onInit();
    // getData();
    // streamSubscription.listen((event) { })

    getDatesData();
  }

  void logOut() async {
    final isLoggedOut = await FirebaseRepoImpl.instance.logOut();

    if (!isLoggedOut) return;

    Get.offAll(() => const SignInScreen1(),
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        transition: Transition.native);
  }

  void getDatesData() async {
    final collectionDataResponse = await datesCollection.get();
    try {
      log('data length : ${collectionDataResponse.docs.length}');
      final datesResponse =
          collectionDataResponse.docs.map((doc) => doc.data()).toList();

      dates = datesResponse;
      datesLisnter.value = datesResponse;
      //  log(datesLisnter.value.toString());
    } catch (err) {
      log(err.toString());
    }
  }

  void removeFromWaitingList(String userId) async {
    final querySnapshot = await waitingListCollection
        .where('userId', isEqualTo: userId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      await doc.reference.delete();
      log('User removed from the waiting list');
    }
  }
}
