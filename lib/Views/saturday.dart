import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Saturday extends StatelessWidget {
  const Saturday({super.key});

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
            'Saturday Setting Page',
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
                  child: controller.disableSaturday.value
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.redAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'saturdayDisabled':
                                  !controller.disableSaturday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Saturday Is Disabled'))
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'saturdayDisabled':
                                  !controller.disableSaturday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Saturday Is Enabled '))),
              trailing: controller.disableSaturday.value
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
              title: controller.Sturaday11am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          '  Sturaday11am': !controller.Sturaday11am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 11 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          '  Sturaday11am': !controller.Sturaday11am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 11 AM Is Disabled ')),
              trailing: controller.Sturaday11am.value
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
              title: controller.Sturaday12am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          '  Sturaday12am': !controller.Sturaday12am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 12  Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          '  Sturaday12am': !controller.Sturaday12am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 12  Is Disabled ')),
              trailing: controller.Sturaday12am.value
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
              title: controller.Sturaday1.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday1': !controller.Sturaday1.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 1 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday1': !controller.Sturaday1.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 1 Is Disabled ')),
              trailing: controller.Sturaday1.value
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
              title: controller.Sturaday2.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday2': !controller.Sturaday2.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 2 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday2': !controller.Sturaday2.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 2 Is Disabled ')),
              trailing: controller.Sturaday2.value
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
              title: controller.Sturaday3.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday3': !controller.Sturaday3.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 3 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday3': !controller.Sturaday3.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 3 Is Disabled ')),
              trailing: controller.Sturaday3.value
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
              title: controller.Sturaday4.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday4': !controller.Sturaday4.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 4 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday4': !controller.Sturaday4.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 4 Is Disabled ')),
              trailing: controller.Sturaday4.value
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
              title: controller.Sturaday5.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday5': !controller.Sturaday5.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 5 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday5': !controller.Sturaday5.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 5 Is Disabled ')),
              trailing: controller.Sturaday5.value
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
              title: controller.Sturaday6.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday6': !controller.Sturaday6.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 6 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday6': !controller.Sturaday6.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 6 Is Disabled ')),
              trailing: controller.Sturaday6.value
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
              title: controller.Sturaday7.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday7': !controller.Sturaday7.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 7 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday1': !controller.Sturaday7.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 7 Is Disabled ')),
              trailing: controller.Sturaday7.value
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
              title: controller.Sturaday8.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday8': !controller.Sturaday8.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 8 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday8': !controller.Sturaday8.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 8 Is Disabled ')),
              trailing: controller.Sturaday8.value
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
              title: controller.Sturaday9.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday9': !controller.Sturaday9.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 9 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday9': !controller.Sturaday9.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 9 Is Disabled ')),
              trailing: controller.Sturaday9.value
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
              title: controller.Sturaday10.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday10': !controller.Sturaday10.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 10 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday10': !controller.Sturaday10.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 10 Is Disabled ')),
              trailing: controller.Sturaday10.value
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
              title: controller.Sturaday11.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday11': !controller.Sturaday11.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 11 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday11': !controller.Sturaday11.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 11 Is Disabled ')),
              trailing: controller.Sturaday11.value
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
              title: controller.Sturaday12.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday12': !controller.Sturaday12.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 12 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'  Sturaday12': !controller.Sturaday12.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Saturday 12 AM Is Disabled ')),
              trailing: controller.Sturaday12.value
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
