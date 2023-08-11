import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/booking_page2.0.dart';
import 'package:flutterappoinmentapp/Views/user_appoiment.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';
import 'constanst.dart';
import 'user_detail_page.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ReservationController _reservationController =
      Get.put(ReservationController());
  // int _selectedIndex = 0;
  void _onItemTapped(int index) async {
    if (index == 0) {
      // If 'Home' is tapped, do nothing (stay on the current page)
      return;
    } else if (index == 1) {
      //   await _reservationController.getDataFromFirestore();

      // If 'Business' is tapped, navigate to the sign-in screen
      Get.to(const BookingScreen(),
          curve: Curves.easeInOut,
          duration: Duration(seconds: 1),
          transition: Transition.fadeIn);
    } else if (index == 2) {
      Get.off(UserDetailsPage(userId: _reservationController.user!.uid),
          arguments: _reservationController.user!.uid,
          curve: Curves.easeInOut,
          duration: Duration(seconds: 1),
          transition: Transition.fadeIn);
      // If 'School' is tapped, do nothing (stay on the current page)
      return;
    } else if (index == 3) {
      Get.off(const UserAppoimetn(),
          curve: Curves.easeInOut,
          duration: Duration(seconds: 1),
          transition: Transition.fadeIn);
      // If 'School' is tapped, do nothing (stay on the current page)
      return;
    }
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
    ReservationController controller = Get.put(ReservationController());
    HomeController controller2 = Get.put(HomeController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottomOpacity: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Image.asset('assets/Frame.png'),
          title: Text(
            "Hello ${controller.userName}",
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller2.logOut();
              },
              icon: const Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         Get.back();
            //       },
            //       child: CircleAvatar(
            //         radius: 15,
            //         child: Icon(
            //           Icons.arrow_back,
            //           size: 20,
            //         ),
            //       ),
            //     ),

            //     IconButton(
            //       onPressed: () {
            //         Get.to(
            //             UserDetailsPage(
            //               userId: controller.user!.uid,
            //             ),
            //             arguments: controller.user!.uid);
            //       },
            //       icon: Icon(
            //         Icons.person,
            //         size: 30,
            //         color: AppConstants.appColor,
            //       ),
            //     )
            //     // Image(
            //     //   image: AssetImage(
            //     //     'assets/back_btn.png',
            //     //   ),
            //     //   width: 30,
            //     // ),
            //     // Image(
            //     //   image: AssetImage('assets/profile.png'),
            //     //   width: 30,
            //     // )
            //   ],
            // ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('userText')
                  .orderBy('timestamp',
                      descending: true) // Fetch documents in descending order
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Reverse the list of documents before mapping them to ListTiles
                // List<QueryDocumentSnapshot> reversedDocs =
                //     snapshot.data!.docs.reversed.toList();

                return Expanded(
                  child: ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      String text = data['text'] ?? '';
                      Timestamp timestamp = data['timestamp'];
                      DateTime dateTime = timestamp.toDate();
                      String formattedTime =
                          DateFormat("hh:mm a, dd MMM yyyy").format(dateTime);

                      return ListTile(
                        title: Text(
                          text,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text(formattedTime),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.to(BookingScreen());
            //     },
            //     child: Text('make an appoimnet'.tr)),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.to(
            //           UserDetailsPage(userId: _reservationController.user!.uid),
            //           arguments: _reservationController.user!.uid);
            //     },
            //     child: Text('View profile'.tr))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 15,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month_outlined),
              label: 'Booking Page'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_sharp),
              label: 'Profile Page'.tr,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), // New icon
              label: 'Dates Page', // Label for the new item
            ),
          ],
          currentIndex: 0,
          selectedItemColor: AppConstants.appColor,
          unselectedItemColor: Colors.grey.shade700,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
