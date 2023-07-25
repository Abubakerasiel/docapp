import 'package:cloud_firestore/cloud_firestore.dart ';
import 'package:flutter/material.dart';

import 'package:flutterappoinmentapp/Views/booking_page.dart';
import 'package:flutterappoinmentapp/Views/user_1.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../Model/User.dart ';
import '../controllers/booking_controller.dart';

class UserPage extends StatefulWidget {
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ReservationController _reservationController =
      Get.put(ReservationController());

  @override
  void initState() {
    // _reservationController
    //     .sendNotificatonToUser(_reservationController.user!.uid);
    // ignore: unnecessary_null_comparison

    super.initState();
  }

  // @override
  // void onInit() {
  //   // super.onInit();

  //   // notificationService.initNotification();
  //   // retrieveUserData(user!.uid);
  //   // sendNotificatonToUser(user!.uid);
  //   // streamSubscription.listen((event) { })
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('userText').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                return Expanded(
                  child: ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String text = data['text'] ?? '';

                      return ListTile(
                        title: Text(text),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(ReservationScreen());
                },
                child: Text('make an appoimnet'.tr)),
            ElevatedButton(
                onPressed: () {
                  Get.to(UserDetailsPage(),
                      arguments: _reservationController.user!.uid);
                },
                child: Text('View profile'.tr))
          ],
        ),
      ),
    );
  }
}
