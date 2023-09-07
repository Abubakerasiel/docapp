import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Saturday extends StatelessWidget {
  const Saturday({super.key});

  Widget build(BuildContext context) {
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(() => HomeScreen1(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
      } else if (index == 2) {
        Get.off(() => const AdminTimeEdit(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
      } else if (index == 3) {
        Get.off(() => const BookingScreen(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
      }
    }

    ReservationController controller = Get.put(ReservationController());
    return Scaffold(
        body: Obx(
          () => ListView(children: [
            ListTile(
              title: GestureDetector(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'saturdayDisabled': !controller.disableSaturday.value
                    });
                    await controller.getDataFromFirestore();
                  },
                  child: controller.disableSaturday.value
                      ? Text('Saturday Is Disabled')
                      : Text('Saturday Is Enabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.disableSaturday.value
                    ? Colors.redAccent
                    : Colors.greenAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday11': !controller.Sturaday11.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday1.value
                      ? Text('Saturday 11 Enabled')
                      : Text('Saturday 11 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday11.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday12': !controller.Sturaday12.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday1.value
                      ? Text('Saturday 12 Enabled')
                      : Text('Saturday 12 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday12.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday1': !controller.Sturaday1.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday1.value
                      ? Text('Saturday 1 Enabled')
                      : Text('Saturday 1 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday1.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday2': !controller.Sturaday2.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday2.value
                      ? Text('Saturday 2 Enabled')
                      : Text('Saturday 2 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday2.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday3': !controller.Sturaday3.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday3.value
                      ? Text('Saturday 3 Enabled')
                      : Text('Saturday 3 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday3.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday4': !controller.Sturaday4.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday4.value
                      ? Text('Saturday 4 Enabled')
                      : Text('Saturday 4 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday4.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday5': !controller.Sturaday5.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday5.value
                      ? Text('Saturday 5 Enabled')
                      : Text('Saturday 5 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday5.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday6': !controller.Sturaday6.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday6.value
                      ? Text('Saturday 6 Enabled')
                      : Text('Saturday 6 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday6.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday7': !controller.Sturaday7.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday1.value
                      ? Text('Saturday 7 Enabled')
                      : Text('Saturday 7 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday7.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday8': !controller.Sturaday8.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday8.value
                      ? Text('Saturday 8 Enabled')
                      : Text('Saturday 8 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday8.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday9': !controller.Sturaday9.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday9.value
                      ? Text('Saturday 9 Enabled')
                      : Text('Saturday 9 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday9.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'  Sturaday10': !controller.Sturaday10.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday10.value
                      ? Text('Saturday 10 Enabled')
                      : Text('Saturday 10 Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday10.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update(
                        {'  Sturaday11am': !controller.Sturaday11am.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday1.value
                      ? Text('Saturday 11Am Enabled')
                      : Text('Saturday 11AM Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday11am.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
            ListTile(
              title: InkWell(
                  onTap: () async {
                    await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update(
                        {'  Sturaday12am': !controller.Sturaday12am.value});
                    await controller.getDataFromFirestore();
                  },
                  child: controller.Sturaday1.value
                      ? Text('Saturday 12Am Enabled')
                      : Text('Saturday 12Am Disabled ')),
              trailing: Icon(
                Icons.check_circle,
                color: controller.Sturaday12am.value
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
            ),
          ]),
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
