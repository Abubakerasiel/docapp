import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/saturday.dart';
import 'package:flutterappoinmentapp/Views/statemnet_page.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
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
    final ReservationController controller = Get.put(ReservationController());
    HomeController controller2 = HomeController();
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(() => HomeScreen1(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        Get.off(() => const StatmentPage(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
      } else if (index == 2) {
      } else if (index == 3) {
        Get.off(() => const BookingScreen(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
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
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,

          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(Saturday());
                },
                child: Text('Saturday Time Modifying')),
            ElevatedButton(
                onPressed: () {}, child: Text('Saturday Time Modifying')),
            ElevatedButton(
                onPressed: () {}, child: Text('Saturday Time Modifying')),
            ElevatedButton(
                onPressed: () {}, child: Text('Saturday Time Modifying')),
            ElevatedButton(
                onPressed: () {}, child: Text('Saturday Time Modifying')),
            ElevatedButton(
                onPressed: () {}, child: Text('Saturday Time Modifying')),
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
