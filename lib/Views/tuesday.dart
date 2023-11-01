import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Tuesday extends StatelessWidget {
  const Tuesday({super.key});

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
            'Tuesday Setting Page',
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
              child: Obx(
                () => ListView(children: [
                  ListTile(
                    title: GestureDetector(
                        onTap: () async {},
                        child: controller.disableTuesday.value
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.redAccent)),
                                onPressed: () async {
                                  await controller.docTime
                                      .doc('WTMfaIqjFuL686hKuK9h')
                                      .update({
                                    'tuesdayDisabled':
                                        !controller.disableTuesday.value
                                  });
                                  await controller.getDataFromFirestore();
                                },
                                child: Text('Tuesday Is Disabled'))
                            : ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.greenAccent)),
                                onPressed: () async {
                                  await controller.docTime
                                      .doc('WTMfaIqjFuL686hKuK9h')
                                      .update({
                                    'tuesdayDisabled':
                                        !controller.disableTuesday.value
                                  });
                                  await controller.getDataFromFirestore();
                                },
                                child: Text('Tuesday Is Enabled '))),
                    trailing: controller.disableTuesday.value
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
                    title: controller.Tuesday11am.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday11am': !controller.Tuesday11am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 11 AM Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday11am': !controller.Tuesday11am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 11 AM Is Disabled ')),
                    trailing: controller.Tuesday11am.value
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
                    title: controller.Tuesday12.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday12': !controller.Tuesday12.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 12 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday12': !controller.Tuesday12.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 12 Is Disabled ')),
                    trailing: controller.Tuesday12.value
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
                    title: controller.Tuesday1.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday1': !controller.Tuesday1.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 1 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday1': !controller.Tuesday1.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 1 Is Disabled ')),
                    trailing: controller.Tuesday1.value
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
                    title: controller.Tuesday2.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday2': !controller.Tuesday2.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 2 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday2': !controller.Tuesday2.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 2 Is Disabled ')),
                    trailing: controller.Tuesday2.value
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
                    title: controller.Tuesday3.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday3': !controller.Tuesday3.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 3 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday3': !controller.Tuesday3.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 3 Is Disabled ')),
                    trailing: controller.Tuesday3.value
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
                    title: controller.Tuesday4.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday4': !controller.Tuesday4.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 4 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday4': !controller.Tuesday4.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 4 Is Disabled ')),
                    trailing: controller.Tuesday4.value
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
                    title: controller.Tuesday5.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday5': !controller.Tuesday5.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 5 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday5': !controller.Tuesday5.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 5 Is Disabled ')),
                    trailing: controller.Tuesday5.value
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
                    title: controller.Tuesday6.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday6': !controller.Tuesday6.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 6 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday6': !controller.Tuesday6.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 6 Is Disabled ')),
                    trailing: controller.Tuesday6.value
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
                    title: controller.Tuesday7.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday7': !controller.Tuesday7.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 7 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday7': !controller.Tuesday7.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 7 Is Disabled ')),
                    trailing: controller.Tuesday7.value
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
                    title: controller.Tuesday8.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday8': !controller.Tuesday8.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 8 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday8': !controller.Tuesday8.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 8 Is Disabled ')),
                    trailing: controller.Tuesday8.value
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
                    title: controller.Tuesday9.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday9': !controller.Tuesday9.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 9 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday9': !controller.Tuesday9.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 9 Is Disabled ')),
                    trailing: controller.Tuesday9.value
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
                    title: controller.Tuesday10.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday10': !controller.Tuesday10.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 10 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday10': !controller.Tuesday10.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 10 Is Disabled ')),
                    trailing: controller.Tuesday10.value
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
                    title: controller.Tuesday11.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday11': !controller.Tuesday11.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 11 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday11': !controller.Tuesday11.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 11 Is Disabled ')),
                    trailing: controller.Tuesday11.value
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
                    title: controller.Tuesday12am.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday12am': !controller.Tuesday12am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 12 AM Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                ' Tuesday12am': !controller.Tuesday12am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Tuesday 12 AM Is Disabled ')),
                    trailing: controller.Tuesday12am.value
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
