import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Monday extends StatelessWidget {
  const Monday({super.key});

  Widget build(BuildContext context) {
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          toolbarHeight: 60,
          elevation: 14,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
          title: Text(
            'Monday Setting Page',
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
        body: Obx(
          () => ListView(children: [
            ListTile(
              title: GestureDetector(
                  onTap: () async {},
                  child: controller.disableMonday.value
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.redAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'mondayDisabled': !controller.disableMonday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Monday Is Disabled'))
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'mondayDisabled': !controller.disableMonday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Monday Is Enabled '))),
              trailing: controller.disableMonday.value
                  ? Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    )
                  : Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday11am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {' Monday11am': !controller.Monday11am.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 11 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {' Monday11am': !controller.Monday11am.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 11 AM Is Disabled ')),
              trailing: controller.Monday11am.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday12am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {' Monday12am': !controller.Monday12am.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 12 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {' Monday12am': !controller.Monday12am.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 12 Is Disabled ')),
              trailing: controller.Monday12am.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday1.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday1': !controller.Monday1.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 1 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday1': !controller.Monday1.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 1 Is Disabled ')),
              trailing: controller.Monday1.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday2.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday2': !controller.Monday2.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 2 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday2': !controller.Monday2.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 11AM Is Disabled ')),
              trailing: controller.Monday2.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday3.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday3': !controller.Monday3.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 3 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday3': !controller.Monday3.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 3 Is Disabled ')),
              trailing: controller.Monday3.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday4.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday4': !controller.Monday4.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 4 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday4': !controller.Monday4.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 4 Is Disabled ')),
              trailing: controller.Monday4.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday5.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday5': !controller.Monday5.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 5 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday5': !controller.Monday5.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 5 Is Disabled ')),
              trailing: controller.Monday5.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday6.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday6': !controller.Monday6.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 6 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday6': !controller.Monday6.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 6 Is Disabled ')),
              trailing: controller.Monday6.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday7.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday7': !controller.Monday7.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 7 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday7': !controller.Monday7.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 7 Is Disabled ')),
              trailing: controller.Monday7.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday8.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday8': !controller.Monday8.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 8 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday8': !controller.Monday8.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 8 Is Disabled ')),
              trailing: controller.Monday8.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday9.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday9': !controller.Monday9.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 9 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday9': !controller.Monday9.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 9 Is Disabled ')),
              trailing: controller.Monday9.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday10.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday10': !controller.Monday10.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 10 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday10': !controller.Monday10.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 10 Is Disabled ')),
              trailing: controller.Monday10.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday11.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday11': !controller.Monday11.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 11 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday11': !controller.Monday11.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 11 Is Disabled ')),
              trailing: controller.Monday11.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                    ),
            ),
            ListTile(
              title: controller.Monday12.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday12': !controller.Monday12.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 12 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({' Monday12': !controller.Monday12.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Monday 12 AM Is Disabled ')),
              trailing: controller.Monday12.value
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    )
                  : Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
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
