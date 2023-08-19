import 'package:flutter/material.dart';

import 'package:flutterappoinmentapp/Views/admin_page.dart';
import 'package:flutterappoinmentapp/Views/user_page.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:flutterappoinmentapp/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart' as tl;
import 'package:get/get.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    //  var name = F
    // irebaseRepoImpl.instance.currentUser?.displayName;
    final currentUser = tl.FirebaseAuth.instance.currentUser;

    current() {
      if (currentUser!.uid == 'TS7icvWb0PPYY90qJ4MiZY16oyp1') {
        return true;
      }
      return false;

      //else if (currentUser!.uid=='RfY49ef1TtPD7f6spDbaMN7aiKd2'){
      //   return ;
      // }
    }

    if (currentUser != null &&
        currentUser.uid == 'cM39KfqhQrZi1Hk9vD5V7yRnID92') {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            toolbarHeight: 70,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            title: current()
                ? const Text(
                    "Hello Secretary",
                    style: TextStyle(color: Colors.white),
                  )
                : const Text(
                    "Hello Dr.Perry",
                    style: TextStyle(color: Colors.white),
                  ),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7, spreadRadius: 3, color: Colors.red)
                    ], shape: BoxShape.circle, color: Colors.redAccent),
                    child: IconButton(
                      onPressed: Get.find<HomeController>().logOut,
                      icon: Icon(
                        Icons.logout,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              )
            ],
          ),
          body: GetX<HomeController>(
            // ignore: invalid_use_of_protected_member
            builder: (controller) => controller.usersLisnter.value.isEmpty
                ? const Center(child: CircularProgressIndicator())
                // ignore: invalid_use_of_protected_member
                : DatesList(dates: controller.datesLisnter.value),
          ),
        ),
      );
    } else if (currentUser != null &&
        currentUser.uid == 'TS7icvWb0PPYY90qJ4MiZY16oyp1') {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.lightBlue,
              toolbarHeight: 70,
              elevation: 14,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70))),
              title: current()
                  ? const Text(
                      "Hello Secretary",
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      "Hello Dr.Perry",
                      style: TextStyle(color: Colors.white),
                    ),
              actions: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 7, spreadRadius: 3, color: Colors.red)
                      ], shape: BoxShape.circle, color: Colors.redAccent),
                      child: IconButton(
                        onPressed: Get.find<HomeController>().logOut,
                        icon: Icon(
                          Icons.logout,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 26,
                    )
                  ],
                )
              ],
            ),
            body: GetX<HomeController>(
              // ignore: invalid_use_of_protected_member
              builder: (controller) => controller.usersLisnter.value.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  // ignore: invalid_use_of_protected_member
                  : DatesList(dates: controller.datesLisnter.value),
            )),
      );
      //return SizedBox();
    } else {
      Get.put(ReservationController());
      return UserPage();
    }
  }
}
