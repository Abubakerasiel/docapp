import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/controllers/booking_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'home.dart';

class Sunday extends StatelessWidget {
  const Sunday({super.key});

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
            'Sunday Setting Page',
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
                        child: controller.disableSunday.value
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.redAccent)),
                                onPressed: () async {
                                  await controller.docTime
                                      .doc('WTMfaIqjFuL686hKuK9h')
                                      .update({
                                    'sundayDisabled':
                                        !controller.disableSunday.value
                                  });
                                  await controller.getDataFromFirestore();
                                },
                                child: Text('Sunday Is Disabled'))
                            : ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.greenAccent)),
                                onPressed: () async {
                                  await controller.docTime
                                      .doc('WTMfaIqjFuL686hKuK9h')
                                      .update({
                                    'sundayDisabled':
                                        !controller.disableSunday.value
                                  });
                                  await controller.getDataFromFirestore();
                                },
                                child: Text('Sunday Is Enabled '))),
                    trailing: controller.disableSunday.value
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
                    title: controller.Sunday11am.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                'Sunday11am': !controller.Sunday11am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 11 AM Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                'Sunday11am': !controller.Sunday11am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 11 AM Is Disabled ')),
                    trailing: controller.Sunday11am.value
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
                    title: controller.Sunday12.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday12': !controller.Sunday12.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 12 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday12': !controller.Sunday12.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 12 Is Disabled ')),
                    trailing: controller.Sunday12.value
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
                    title: controller.Sunday1.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday1 ': !controller.Sunday1.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 1 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday1 ': !controller.Sunday1.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 1 Is Disabled ')),
                    trailing: controller.Sunday1.value
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
                    title: controller.Sunday2.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday2': !controller.Sunday2.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 2 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday2': !controller.Sunday2.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 2 Is Disabled ')),
                    trailing: controller.Sunday2.value
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
                    title: controller.Sunday3.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday3': !controller.Sunday3.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 3 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                'Sunday11am': !controller.Sunday3.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 3 Is Disabled ')),
                    trailing: controller.Sunday3.value
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
                    title: controller.Sunday4.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday4': !controller.Sunday4.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 4 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday4': !controller.Sunday4.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 4 Is Disabled ')),
                    trailing: controller.Sunday4.value
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
                    title: controller.Sunday5.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday5': !controller.Sunday5.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 5 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday5': !controller.Sunday5.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 5 Is Disabled ')),
                    trailing: controller.Sunday5.value
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
                    title: controller.Sunday6.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday6': !controller.Sunday6.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 6 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday6': !controller.Sunday6.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 6 Is Disabled ')),
                    trailing: controller.Sunday6.value
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
                    title: controller.Sunday7.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday7': !controller.Sunday7.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 7 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday7': !controller.Sunday7.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 7 Is Disabled ')),
                    trailing: controller.Sunday7.value
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
                    title: controller.Sunday8.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday8': !controller.Sunday8.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 8 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday8': !controller.Sunday8.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 8 Is Disabled ')),
                    trailing: controller.Sunday8.value
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
                    title: controller.Sunday9.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday9': !controller.Sunday9.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 9 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday9': !controller.Sunday9.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 9 Is Disabled ')),
                    trailing: controller.Sunday9.value
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
                    title: controller.Sunday10.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday10': !controller.Sunday10.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 10 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday10': !controller.Sunday10.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 10 Is Disabled ')),
                    trailing: controller.Sunday10.value
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
                    title: controller.Sunday11.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday11': !controller.Sunday11.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 11 Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update(
                                      {'Sunday11': !controller.Sunday11.value});
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 11  Is Disabled ')),
                    trailing: controller.Sunday11.value
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
                    title: controller.Sunday12am.value
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.greenAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                'Sunday12am': !controller.Sunday12am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 12 AM Is Enabled'))
                        : ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            onPressed: () async {
                              await controller.docTime
                                  .doc('WTMfaIqjFuL686hKuK9h')
                                  .update({
                                'Sunday12am': !controller.Sunday12am.value
                              });
                              await controller.getDataFromFirestore();
                            },
                            child: Text('Sunday 12 AM Is Disabled ')),
                    trailing: controller.Sunday12am.value
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
