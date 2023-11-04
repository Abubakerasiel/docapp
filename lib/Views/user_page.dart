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

// ignore: must_be_immutable
class UserPage extends StatefulWidget {
  String? Uid;
  UserPage({super.key, this.Uid});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ReservationController _reservationController =
      Get.put(ReservationController());

  HomeController controller2 = Get.put(HomeController());

  // int _selectedIndex = 0;
  void _onItemTapped(int index) async {
    if (index == 0) {
      // If 'Home' is tapped, do nothing (stay on the current page)
      return;
    } else if (index == 1) {
      Get.off(() => const BookingScreen(),
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          transition: Transition.native);
    } else if (index == 2) {
      Get.off(
          () => UserDetailsPage(
                userId: _reservationController.user!.uid,
              ),
          arguments: _reservationController.user!.uid,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          transition: Transition.native);
      // If 'School' is tapped, do nothing (stay on the current page)
      return;
    } else if (index == 3) {
      Get.off(() => const UserAppoimetn(),
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          transition: Transition.native);
      // If 'School' is tapped, do nothing (stay on the current page)
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          title: Obx(
            () => Text(
              " ${_reservationController.userName.value}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.red)
                  ], shape: BoxShape.circle, color: Colors.redAccent),
                  child: IconButton(
                    onPressed: () => controller2.logOut(),
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
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              width: constraints.maxWidth > 500 ? 400 : double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " ${_reservationController.userName.value}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('userText')
                        .orderBy('timestamp', descending: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        // No data or data is empty, display a message
                        return Expanded(
                            child: Center(
                                child: Text(
                          'No announcements yet.'.tr,
                          style: TextStyle(fontSize: 20),
                        )));
                      }

                      return Expanded(
                        child: ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            String text = data['text'] ?? '';
                            Timestamp timestamp = data['timestamp'];
                            DateTime dateTime = timestamp.toDate();
                            String formattedTime =
                                DateFormat("hh:mm a, dd MMM yyyy")
                                    .format(dateTime);

                            return ListTile(
                              dense: false,
                              // titleAlignment: ListTileTitleAlignment.threeLine,

                              title: Text(
                                text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(formattedTime),
                              //trailing: SizedBox(),
                            );
                          }).toList(), // Ensure that you're returning a List<Widget>
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppConstants.appColor,
          onPressed: () {
            if (Get.locale!.languageCode == "ar") {
              Get.updateLocale(const Locale("en"));
            } else {
              Get.updateLocale(const Locale("ar"));
            }
          },
          child: const Icon(Icons.g_translate),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), // New icon
              label: 'Dates Page'.tr, // Label for the new item
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
