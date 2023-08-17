import 'package:flutter/material.dart';

import 'package:flutterappoinmentapp/Views/admin_page.dart';
import 'package:flutterappoinmentapp/Views/user_page.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:flutterappoinmentapp/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart' as tl;
import 'package:get/get.dart';

// extension on Gender {
//   Color getColor() {
//     switch (this) {
//       case Gender.male:
//         return Colors.red;
//       case Gender.female:
//         return Colors.blue;
//     }
//   }
// }

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    //  var name = F
    // irebaseRepoImpl.instance.currentUser?.displayName;
    final currentUser = tl.FirebaseAuth.instance.currentUser;

    current() {
      if (currentUser!.uid == 'BP3ONAOGn8WEJm9IevwkUgke15T2') {
        return true;
      }
      return false;

      //else if (currentUser!.uid=='RfY49ef1TtPD7f6spDbaMN7aiKd2'){
      //   return ;
      // }
    }

    if (currentUser != null &&
        currentUser.uid == 'RfY49ef1TtPD7f6spDbaMN7aiKd2') {
      return MaterialApp(
        home: Scaffold(
          //  SizedBox(
          //       height: 50,
          //     ),
          //     Text('Hello'),
          //     Row(
          //       children: [Text('data'), Image.asset('assets/Frame.png')],
          //     ),

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
          // body: GetBuilder<HomeControlleuer>(
          //   builder: (controller) => controller.users == null
          //       ? Center(child: CircularProgressIndicator())
          //       : UsersList(users: controller.users!),
          // ),
          body: GetX<HomeController>(
            // ignore: invalid_use_of_protected_member
            builder: (controller) => controller.usersLisnter.value.isEmpty
                ? const Center(child: CircularProgressIndicator())
                // ignore: invalid_use_of_protected_member
                : DatesList(dates: controller.datesLisnter.value),
          ),

          // get firebase Firestore users collenction with StreamBuilder
          // body: StreamBuilder(
          //   stream: HomeController.instance.usersRef.snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       final docs = snapshot.data!.docs;
          //       log(docs.length.toString());
          //
          //       return ListView.separated(
          //         padding: EdgeInsets.symmetric(horizontal: 12),
          //         itemCount: docs.length,
          //         itemBuilder: (context, index) {
          //           final json = docs[index].data();
          //
          //           final user = local.User.fromJson(json);
          //
          //           return Container(
          //             height: 100,
          //             // color: Colors.redw,
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 CircleAvatar(
          //                   radius: 30,
          //                   backgroundColor: Colors.amber,
          //                 ),
          //                 SizedBox(width: 10),
          //                 Expanded(
          //                     child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(user.name ?? ''),
          //                     Text(user.phone ?? ''),
          //                     // Gender.male.getColor()
          //                     //Gender.male.color;
          //                   ],
          //                 )),
          //                 SizedBox(width: 10),
          //                 Icon(user.gender?.icon)
          //               ],
          //             ),
          //           );
          //         },
          //         separatorBuilder: (context, index) => SizedBox(height: 10),
          //       );
          //     } else {
          //       return const CircularProgressIndicator();
          //     }
          //   },
          // ),
          //
        ),
      );
    } else if (currentUser != null &&
        currentUser.uid == 'BP3ONAOGn8WEJm9IevwkUgke15T2') {
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
