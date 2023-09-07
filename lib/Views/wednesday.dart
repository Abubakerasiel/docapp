import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Wednesday extends StatelessWidget {
  const Wednesday({super.key});

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
            'Wednesday Setting Page',
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
                  child: controller.disableWednesday.value
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.redAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'disableWednesday':
                                  !controller.disableWednesday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Wednesday Is Disabled'))
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'disableWednesday':
                                  !controller.disableWednesday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Wednesday Is Enabled '))),
              trailing: controller.disableWednesday.value
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
              title: controller.Wedneseday11am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday11am': !controller.Wedneseday11am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 11 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday11am': !controller.Wedneseday11am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 11 AM Is Disabled ')),
              trailing: controller.Wedneseday11am.value
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
              title: controller.Wedneseday12.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday12': !controller.Wedneseday12.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 12  Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday12': !controller.Wedneseday12.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 12  Is Disabled ')),
              trailing: controller.Wedneseday12.value
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
              title: controller.Wedneseday1.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday1': !controller.Wedneseday1.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 1 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday1': !controller.Wedneseday1.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 11 AM Is Disabled ')),
              trailing: controller.Wedneseday1.value
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
              title: controller.Wedneseday2.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday2': !controller.Wedneseday2.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 2 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday2': !controller.Wedneseday2.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 2 Is Disabled ')),
              trailing: controller.Wedneseday2.value
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
              title: controller.Wedneseday3.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday3': !controller.Wedneseday3.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 3 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday3': !controller.Wedneseday3.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 3 Is Disabled ')),
              trailing: controller.Wedneseday3.value
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
              title: controller.Wedneseday4.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday4': !controller.Wedneseday4.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 4 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday4': !controller.Wedneseday4.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 4 Is Disabled ')),
              trailing: controller.Wedneseday4.value
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
              title: controller.Wedneseday5.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday5': !controller.Wedneseday5.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 5 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday5': !controller.Wedneseday5.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 5 Is Disabled ')),
              trailing: controller.Wedneseday5.value
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
              title: controller.Wedneseday6.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday6': !controller.Wedneseday6.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text(' Wednesday 6 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday6': !controller.Wedneseday6.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 6 Is Disabled ')),
              trailing: controller.Wedneseday6.value
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
              title: controller.Wedneseday7.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday7': !controller.Wedneseday7.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 7 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday7': !controller.Wedneseday7.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 7 Is Disabled ')),
              trailing: controller.Wedneseday7.value
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
              title: controller.Wedneseday8.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday8': !controller.Wedneseday8.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 8 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday8': !controller.Wedneseday8.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 8 Is Disabled ')),
              trailing: controller.Wedneseday8.value
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
              title: controller.Wedneseday9.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday9': !controller.Wedneseday9.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 9 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday9': !controller.Wedneseday9.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 9 Is Disabled ')),
              trailing: controller.Wedneseday9.value
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
              title: controller.Wedneseday10.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday10': !controller.Wedneseday10.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 10 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday10': !controller.Wedneseday10.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 10 Is Disabled ')),
              trailing: controller.Wedneseday10.value
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
              title: controller.Wedneseday11.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday11': !controller.Wedneseday11.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 11  Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday11': !controller.Wedneseday11.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 11  Is Disabled ')),
              trailing: controller.Wedneseday11.value
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
              title: controller.Wedneseday12am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday12am': !controller.Wedneseday12am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 12 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          ' Wedneseday12am': !controller.Wedneseday12am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Wednesday 12 AM Is Disabled ')),
              trailing: controller.Wedneseday12am.value
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
