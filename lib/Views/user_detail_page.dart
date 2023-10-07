import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/user_appoiment.dart';
import 'package:flutterappoinmentapp/Views/user_page.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';

class UserDetailsPage extends StatefulWidget {
  final String userId;

  const UserDetailsPage({super.key, required this.userId});
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  var data = Get.arguments;
  // @override
  final ReservationController _reservationController =
      Get.put(ReservationController());
  @override
  void initState() {
    _reservationController.paymentStatus(data);

    super.initState();
  }

  // Function to show the weight edit dialog
  Future<void> _showWeightEditDialog(BuildContext context) async {
    String editedWeight = _reservationController.weight.value;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Weight'.tr),
          content: TextFormField(
            initialValue: editedWeight,
            onChanged: (value) {
              editedWeight = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _reservationController.weight.value = editedWeight;
                _updateWeight(context);
                // Save the edited weight to the ReservationController

                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller2 = Get.put(HomeController());
    final ReservationController reservationController =
        Get.put(ReservationController());
    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(() => UserPage(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        // await reservationController.getDataFromFirestore();
        // If 'Business' is tapped, navigate to the sign-in screen
        Get.to(() => const BookingScreen(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
      } else if (index == 2) {
        return;
      } else if (index == 3) {
        Get.off(() => const UserAppoimetn(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);

        return;
      }
    }

    // final ReservationController _reservationController =
    //     Get.put(ReservationController());
    var data = Get.arguments;

    bool x = false;
    bool y = false;
    if (reservationController.user!.uid == data) {
      y = true;
    }
    if (reservationController.user!.uid == 'cM39KfqhQrZi1Hk9vD5V7yRnID92' ||
        reservationController.user!.uid == 'TS7icvWb0PPYY90qJ4MiZY16oyp1') {
      x = true;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          toolbarHeight: 70,
          elevation: 14,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
          ),
          title: Text(
            "${reservationController.userName} ",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Colors.red,
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
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
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              title: Text('Name :'.tr),
              subtitle: Text(
                ' ${reservationController.userName.value}',
                style: const TextStyle(fontSize: 17),
                maxLines: 3,
              ),
            ),
            ListTile(
              title: Text('Phone :'.tr),
              subtitle: Text(
                reservationController.userPhone.value,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            ListTile(
              title: Text('Age :'.tr,
                  style: const TextStyle(
                    fontSize: 17,
                  )),
              subtitle: Text(
                reservationController.age.value,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            ListTile(
              title: Text('Height :'.tr),
              subtitle: Text(
                reservationController.height.value,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            ListTile(
              title: Text('Gender :'.tr),
              subtitle: reservationController.gender.value == 'male'
                  ? Text('male'.tr, style: const TextStyle(fontSize: 14))
                  : Text('female'.tr, style: const TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('Weight :'.tr),
              subtitle: GestureDetector(
                onTap: () => _showWeightEditDialog(context),
                child: Obx(
                  () => Text(
                    reservationController.weight.value,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Medical Issue :'.tr),
              subtitle: Text(
                reservationController.medicalIssue.value.tr,
                style: const TextStyle(fontSize: 17),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ),
            ListTile(
              title: Text('Package Type :'.tr),
              subtitle: reservationController.packageType.value == 'byPackage'
                  ? Text('By Package'.tr, style: const TextStyle(fontSize: 17))
                  : Text('By Time'.tr, style: const TextStyle(fontSize: 17)),
            ),
            reservationController.packageType.value == 'byPackage'
                ? ListTile(
                    title: Text('Remaining Package:'.tr),
                    subtitle:
                        Obx(() => Text('${reservationController.package}')),
                  )
                : SizedBox(),
            ListTile(
              title: ElevatedButton(
                  onPressed: () {
                    _reservationController.deleteUserAndDocument(
                        _reservationController.user!.uid);
                  },
                  child: Text('Delete Account')),
            )
            // ... continue with other ListTiles as needed ...
          ],
        ),
        bottomNavigationBar: y
            ? BottomNavigationBar(
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
                    label: 'Booking Page'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_sharp),
                    label: 'Profile Page'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_rounded), // New icon
                    label: 'Dates Page'.tr, // Label for the new item
                  ),
                ],
                currentIndex: 2,
                selectedItemColor: AppConstants.appColor,
                unselectedItemColor: Colors.grey.shade700,
                showUnselectedLabels: true,
                onTap: _onItemTapped,
              )
            : x && reservationController.packageType.value == 'byPackage'
                ? Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: reservationController.y.value
                                    ? const MaterialStatePropertyAll(
                                        Colors.green)
                                    : const MaterialStatePropertyAll(
                                        Colors.amber)),
                            onPressed: () async {
                              await reservationController.paidPackge(data);
                              await reservationController.paymentStatus(data);
                              Get.snackbar(' Successful Payment'.tr,
                                  'The package has been updated successfuly'.tr,
                                  backgroundColor: Colors.greenAccent,
                                  snackPosition: SnackPosition.BOTTOM);

                              //  _reservationController. y.value = true;
                            },
                            child: reservationController.y.value
                                ? Text('Paid For The Package'.tr)
                                : Text('Did Not Pay For The Package'.tr)),
                        // SizedBox(
                        //   width: 100,
                        // ),
                        reservationController.y.value
                            ? const Icon(
                                Icons.check_circle_outlined,
                                color: Colors.green,
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                : const SizedBox());
  }

  void _updateWeight(BuildContext context) async {
    try {
      // Save the updated weight to Firestore
      await _reservationController.usersRef
          .doc(_reservationController.user!.uid)
          .update({'weight': _reservationController.weight.value});

      // Show a success message
      Get.snackbar(
        'weight update'.tr,
        'weight updated successulfy '.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.greenAccent,
        colorText: Colors.white,
      );
    } catch (error) {
      // Show an error message if update fails
      Get.snackbar(
        'weight update'.tr,
        'the weight did not update'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
