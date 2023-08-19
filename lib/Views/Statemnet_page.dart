import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutterappoinmentapp/Views/constanst.dart';
import 'package:flutterappoinmentapp/Views/home.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';

class StatmentPage extends StatelessWidget {
  const StatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    final ReservationController controller = Get.put(ReservationController());
    HomeController controller2 = Get.put(HomeController());
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(HomeScreen1(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
      } else if (index == 2) {
        Get.off(const AdminTimeEdit(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
      }
    }

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
            title: const Text(
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
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: txt,
                  autofocus: false,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: AppConstants.appColor), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: "Post Statement",
                    hintStyle: TextStyle(
                        color: AppConstants.nameColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: AppConstants.appColor))),
                        backgroundColor:
                            MaterialStatePropertyAll(AppConstants.appColor)),
                    onPressed: () {
                      Timestamp timestamp = Timestamp.now();
                      controller.saveTextToFirebase(txt.text, timestamp);
                      controller.sendAllUsersNotfication(
                          controller.tak!, txt.text, 'New annocmesnt');
                      txt.clear();
                    },
                    child: Text('Post Statment'.tr)),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('userText')
                      .orderBy('timestamp',
                          descending:
                              true) // Fetch documents in descending order
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
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
              ],
            ),
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
                label: 'Statement Page'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_sharp),
                label: 'Time Editing Page'.tr,
              ),
            ],
            currentIndex: 1,
            selectedItemColor: AppConstants.appColor,
            unselectedItemColor: Colors.grey.shade700,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          )),
    );
  }
}
