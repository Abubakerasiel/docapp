import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterappoinmentapp/Auth/sigin_screen.dart';

import 'package:get/get.dart';

import '../Model/User.dart';
import 'Firebase_Repo.dart';

CollectionReference waitingListCollection =
    FirebaseFirestore.instance.collection('waiting_list');

final usersRef = FirebaseFirestore.instance.collection('users');
CollectionReference datesCollection =
    FirebaseFirestore.instance.collection('dates');

class HomeController extends GetxController {
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

    usersRef.snapshots().listen((event) {
      usersLisnter.value = convertToUsers(event);

      // users = ;
    });
    getDatesData();
  }

  void logOut() async {
    final isLoggedOut = await FirebaseRepoImpl.instance.logOut();

    if (!isLoggedOut) return;

    Get.offAll(SignInScreen1());
  }

  void getData() async {
    final colloectionDataResponse = await usersRef.get();
    try {
      log('data length : ${colloectionDataResponse.docs.length}');
      final usersResponse = colloectionDataResponse.docs
          .map((e) => User.fromJson(e.data()))
          .toList();

      users = usersResponse;
      update();
    } catch (err) {
      log(err.toString());
    }
  }

  getRealTimeData() {
    final colloectionDataResponse = usersRef.snapshots();
    colloectionDataResponse.asBroadcastStream(
      onListen: (subscription) {},
    );
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

  List<User> convertToUsers(QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    final usersResponse =
        querySnapshot.docs.map((e) => User.fromJson(e.data())).toList();

    return usersResponse;
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
