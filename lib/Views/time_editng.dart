import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/monday.dart';
import 'package:flutterappoinmentapp/Views/saturday.dart';
import 'package:flutterappoinmentapp/Views/statemnet_page.dart';
import 'package:flutterappoinmentapp/Views/sunday.dart';
import 'package:flutterappoinmentapp/Views/thrusday.dart';
import 'package:flutterappoinmentapp/Views/tuesday.dart';
import 'package:flutterappoinmentapp/Views/wednesday.dart';
import 'package:get/get.dart';

//import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class AdminTimeEdit extends StatefulWidget {
  const AdminTimeEdit({super.key});

  @override
  State<AdminTimeEdit> createState() => _AdminTimeEditState();
}

class _AdminTimeEditState extends State<AdminTimeEdit> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    // final ReservationController controller = Get.put(ReservationController());
    HomeController controller2 = HomeController();
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(() => HomeScreen1(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        Get.off(() => const StatmentPage(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
      } else if (index == 2) {
      } else if (index == 3) {
        Get.off(() => const BookingScreen(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          toolbarHeight: 70,
          elevation: 14,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
          title: Text(
            'Appoiments Setting Page',
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Terms And Conditions',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txt,
                      maxLines: 10,
                      autofocus: false,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: AppConstants.appColor), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText:
                            "                  Enter Terms And Conditions",
                        hintStyle: TextStyle(
                            color: AppConstants.nameColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseFirestore.instance
                                .collection("terms")
                                .doc('BPtaalhXBMhdryhDFKQ2')
                                .update({'Terms': txt.text});

                            Get.snackbar('Successfull Editing ',
                                'You Have Successfuly Updated The Terms And Conditions',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.greenAccent,
                                colorText: Colors.black);

                            txt.text = '';
                          } catch (e) {
                            Get.snackbar('upadte Failed ', e.toString(),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.redAccent,
                                colorText: Colors.black);
                          }
                        },
                        child: Text("Submit")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,

                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => Saturday(),
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.native);
                            },
                            child: Text(
                              'Saturday Times ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => Sunday(),
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.native);
                            },
                            child: Text(
                              'Sunday Times',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => Monday(),
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.native);
                            },
                            child: Text(
                              'Monday Times',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => Tuesday(),
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.native);
                            },
                            child: Text(
                              'Tuesday Times',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => Wednesday(),
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.native);
                            },
                            child: Text(
                              'Wednesday Times',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => Thursday(),
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  transition: Transition.native);
                            },
                            child: Text(
                              'Thursday Times',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
              icon: const Icon(Icons.post_add),
              label: 'Statement Page'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_sharp),
              label: 'Time Editing Page'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.calendar_month_outlined),
              label: 'Calender Page'.tr,
            ),
          ],
          currentIndex: 2,
          selectedItemColor: AppConstants.appColor,
          unselectedItemColor: Colors.grey.shade700,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }
}
