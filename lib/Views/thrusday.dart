import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Thursday extends StatelessWidget {
  const Thursday({super.key});

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
            'Thursday Setting Page',
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
                  child: controller.disableThursday.value
                      ? ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.redAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'disableThursday':
                                  !controller.disableThursday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Thursday Is Disabled'))
                      : ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          onPressed: () async {
                            await controller.docTime
                                .doc('WTMfaIqjFuL686hKuK9h')
                                .update({
                              'disableThursday':
                                  !controller.disableThursday.value
                            });
                            await controller.getDataFromFirestore();
                          },
                          child: Text('Thursday Is Enabled '))),
              trailing: controller.disableThursday.value
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
              title: controller.Thrusday11am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          'Thrusday11am': !controller.Thrusday11am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 11 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          'Thrusday11am': !controller.Thrusday11am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 11 AM Is Disabled ')),
              trailing: controller.Thrusday11am.value
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
              title: controller.Thrusday12.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'Thrusday12': !controller.Thrusday12.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 12 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'Thrusday12': !controller.Thrusday12.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 12 Is Disabled ')),
              trailing: controller.Thrusday12.value
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
              title: controller.Thrusday1.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday1': !controller.Thrusday1.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 1 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday1': !controller.Thrusday1.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 1 Is Disabled ')),
              trailing: controller.Thrusday1.value
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
              title: controller.Thrusday2.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday2': !controller.Thrusday2.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 2 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday2': !controller.Thrusday2.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 2 Is Disabled ')),
              trailing: controller.Thrusday2.value
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
              title: controller.Thrusday3.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday3': !controller.Thrusday3.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 3 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday3': !controller.Thrusday3.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 3 Is Disabled ')),
              trailing: controller.Thrusday3.value
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
              title: controller.Thrusday4.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday4': !controller.Thrusday4.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 4 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday4': !controller.Thrusday4.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 4 Is Disabled ')),
              trailing: controller.Thrusday4.value
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
              title: controller.Thrusday5.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday5': !controller.Thrusday5.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 5 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday5': !controller.Thrusday5.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 5 Is Disabled ')),
              trailing: controller.Thrusday5.value
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
              title: controller.Thrusday6.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday6': !controller.Thrusday6.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 6 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday6': !controller.Thrusday6.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 6 Is Disabled ')),
              trailing: controller.Thrusday6.value
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
              title: controller.Thrusday7.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday7': !controller.Thrusday7.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 7 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday7': !controller.Thrusday7.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 7 Is Disabled ')),
              trailing: controller.Thrusday7.value
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
              title: controller.Thrusday8.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday8': !controller.Thrusday8.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 8 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday8': !controller.Thrusday8.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 8 Is Disabled ')),
              trailing: controller.Thrusday8.value
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
              title: controller.Thrusday9.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday9': !controller.Thrusday9.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 9 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({'Thrusday9': !controller.Thrusday9.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 9 Is Disabled ')),
              trailing: controller.Thrusday9.value
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
              title: controller.Thrusday10.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'Thrusday10': !controller.Thrusday10.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 10 Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'Thrusday10': !controller.Thrusday10.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 10 Is Disabled ')),
              trailing: controller.Thrusday10.value
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
              title: controller.Thrusday11.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'Thrusday11 ': !controller.Thrusday11.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 11  Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update(
                                {'Thrusday11 ': !controller.Thrusday11.value});
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 11  Is Disabled ')),
              trailing: controller.Thrusday11.value
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
              title: controller.Thrusday12am.value
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          'Thrusday12am': !controller.Thrusday12am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 12 AM Is Enabled'))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () async {
                        await controller.docTime
                            .doc('WTMfaIqjFuL686hKuK9h')
                            .update({
                          'Thrusday12am': !controller.Thrusday12am.value
                        });
                        await controller.getDataFromFirestore();
                      },
                      child: Text('Thursday 12 AM Is Disabled ')),
              trailing: controller.Thrusday12am.value
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
