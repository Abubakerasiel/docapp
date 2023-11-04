import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  const UserDetailsPage({
    super.key,
    required this.userId,
  });
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  RxBool m = true.obs;
  RxString userName = ''.obs;
  RxString userPhone = RxString('');
  RxString medicalIssue = RxString('');
  RxString weight = ''.obs;

  RxString age = RxString('');
  RxString height = RxString('');
  RxString gender = RxString('');
  RxString packageType = RxString('');
  RxInt package = 0.obs;

  // @override
  final ReservationController _reservationController =
      Get.put(ReservationController());

  Future<Map<String, dynamic>?> retrieveUserData(String userId) async {
    //print('jkkkk');
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      if (snapshot.exists) {
        userName.value = snapshot.data()?['name'];
        userPhone.value = snapshot.data()?['phone'];
        weight.value = snapshot.data()?['weight'];
        age.value = snapshot.data()?['age'];
        height.value = snapshot.data()?['height'];
        gender.value = snapshot.data()?['gender'];
        package.value = snapshot.data()?['package'];
        medicalIssue.value = snapshot.data()?['medical_issue'];
        packageType.value = snapshot.data()?['packageType'];

        return snapshot.data();
      } else {
        log('User document does not exist');
        return null;
      }
    } catch (e) {
      log('Error retrieving user data: $e');
      return null;
    }
  }

  @override
  void initState() {
    retrieveUserData(widget.userId).then((value) => m.value = false);
    _reservationController.paymentStatus(widget.userId);

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

    RxBool x = false.obs;
    RxBool y = false.obs;
    if (reservationController.user!.uid == widget.userId) {
      setState(() {
        y.value = true;
      });
    }
    if (reservationController.user!.uid == 'cM39KfqhQrZi1Hk9vD5V7yRnID92' ||
        reservationController.user!.uid == 'TS7icvWb0PPYY90qJ4MiZY16oyp1') {
      setState(() {
        x.value = true;
      });
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
          title: Obx(
            () => Text(
              "${userName.value} ",
              style: TextStyle(color: Colors.white),
            ),
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
        body: Obx(
          () => m.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) => SizedBox(
                      width: constraints.maxWidth > 500 ? 400 : double.infinity,
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          ListTile(
                            title: Text('Name :'.tr),
                            subtitle: Text(
                              ' ${userName.value}',
                              style: const TextStyle(fontSize: 17),
                              maxLines: 3,
                            ),
                          ),
                          ListTile(
                            title: Text('Phone :'.tr),
                            subtitle: Text(
                              userPhone.value,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                          ListTile(
                            title: Text('Age :'.tr,
                                style: const TextStyle(
                                  fontSize: 17,
                                )),
                            subtitle: Text(
                              age.value,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Height :'.tr),
                            subtitle: Text(
                              height.value,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                          ListTile(
                            title: Text('Gender :'.tr),
                            subtitle: gender.value == 'male'
                                ? Text('male'.tr,
                                    style: const TextStyle(fontSize: 14))
                                : Text('female'.tr,
                                    style: const TextStyle(fontSize: 14)),
                          ),
                          ListTile(
                            title: Text('Weight :'.tr),
                            subtitle: GestureDetector(
                              onTap: () => _showWeightEditDialog(context),
                              child: Obx(
                                () => Text(
                                  weight.value,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text('Medical Issue :'.tr),
                            subtitle: Text(
                              medicalIssue.value.tr,
                              style: const TextStyle(fontSize: 17),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          ListTile(
                            title: Text('Package Type :'.tr),
                            subtitle: packageType.value == 'byPackage'
                                ? Text('By Package'.tr,
                                    style: const TextStyle(fontSize: 17))
                                : Text('By Time'.tr,
                                    style: const TextStyle(fontSize: 17)),
                          ),
                          packageType.value == 'byPackage'
                              ? ListTile(
                                  title: Text('Remaining Package:'.tr),
                                  subtitle: Obx(() => Text('${package}')),
                                )
                              : SizedBox(),
                          ListTile(
                            title: ElevatedButton(
                                onPressed: () {
                                  _reservationController
                                      .deleteUserAndDocument(widget.userId);
                                },
                                child: Text('Delete Account')),
                          )
                          // ... continue with other ListTiles as needed ...
                        ],
                      ),
                    ),
                  ),
                ),
        ),
        bottomNavigationBar: y.value
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
            : x.value
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
                              await reservationController
                                  .paidPackge(widget.userId);
                              await reservationController
                                  .paymentStatus(widget.userId);
                              await retrieveUserData(widget.userId);
                              Get.snackbar(' Successful Payment'.tr,
                                  'The package has been updated successfuly'.tr,
                                  backgroundColor: Colors.greenAccent,
                                  snackPosition: SnackPosition.BOTTOM);

                              //  _reservationController. y.value = true;
                            },
                            child: reservationController.y.value
                                ? Text('Paid'.tr)
                                : Text('Did Not Pay'.tr)),
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
