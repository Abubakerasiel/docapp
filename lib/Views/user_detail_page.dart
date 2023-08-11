import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/user_appoiment.dart';
import 'package:flutterappoinmentapp/Views/user_page.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
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
    final ReservationController reservationController =
        Get.put(ReservationController());
    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(const UserPage(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        // await reservationController.getDataFromFirestore();
        // If 'Business' is tapped, navigate to the sign-in screen
        Get.to(const BookingScreen(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
      } else if (index == 2) {
        // Get.to(UserDetailsPage(userId: _reservationController.user!.uid),
        //     arguments: _reservationController.user!.uid);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 3) {
        Get.off(const UserAppoimetn(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // Get.to(UserDetailsPage(userId: _reservationController.user!.uid),
        //     arguments: _reservationController.user!.uid);
        // If 'School' is tapped, do nothing (stay on the current page)
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
    if (reservationController.user!.uid == 'RfY49ef1TtPD7f6spDbaMN7aiKd2' ||
        reservationController.user!.uid == 'BP3ONAOGn8WEJm9IevwkUgke15T2') {
      x = true;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstants.appColor,
          title: Text('${reservationController.userName.value} Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Phone :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Age :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Height :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Gender :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Weight :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Medical Issue :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Package Type :'.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ' ${reservationController.userName.value}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        reservationController.userPhone.value,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        reservationController.age.value,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        reservationController.height.value,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        reservationController.gender.value.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        child: Text(
                          reservationController.weight.value,
                          style: const TextStyle(fontSize: 18),
                        ),

                        // Open the weight edit dialog when weight is tapped
                        onPressed: () => _showWeightEditDialog(context),
                      ),
                      Text(
                        reservationController.medicalIssue.value.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        reservationController.packageType.value.tr,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Name'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     Text(
                  //       ' ${_reservationController.userName.value}',
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Phone'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     Text(
                  //       '${_reservationController.userPhone.value}',
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Age'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     Text(
                  //       '${_reservationController.age.value}',
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Height'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     Text(
                  //       '${_reservationController.height.value}',
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Gender'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     Text(
                  //       '${_reservationController.gender.value}'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Weight'.tr,
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     ElevatedButton(
                  //       child: Text(
                  //         '${_reservationController.weight.value}',
                  //         style: TextStyle(fontSize: 18),
                  //       ),

                  //       // Open the weight edit dialog when weight is tapped
                  //       onPressed: () => _showWeightEditDialog(context),
                  //     ),
                  //   ],
                  // ),
                  // x
                  //     ? ElevatedButton(
                  //         style: ButtonStyle(
                  //             backgroundColor: _reservationController.y.value
                  //                 ? MaterialStatePropertyAll(Colors.green)
                  //                 : MaterialStatePropertyAll(Colors.amber)),
                  //         onPressed: () async {
                  //           _reservationController.paidPackge(data);
                  //           _reservationController.paymentStatus(data);
                  //           Get.snackbar(' Successful Payment',
                  //               'The package has been updated successfuly',
                  //               backgroundColor: Colors.greenAccent,
                  //               snackPosition: SnackPosition.BOTTOM);

                  //           //  _reservationController. y.value = true;
                  //         },
                  //         child: _reservationController.y.value
                  //             ? Text('paid'.tr)
                  //             : Text('did not paid'.tr))
                  //     : SizedBox(),
                  // _reservationController.y.value
                  //     ? Icon(
                  //         Icons.check_circle_outlined,
                  //         color: Colors.green,
                  //       )
                  //     : SizedBox()
                ],
              );
            },
          ),
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
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_rounded), // New icon
                    label: 'Dates Page', // Label for the new item
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
                                ? Text('Paid'.tr)
                                : Text('did not Paid'.tr)),
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
        'weight update',
        'weight updated successulfy ',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.greenAccent,
        colorText: Colors.white,
      );
    } catch (error) {
      // Show an error message if update fails
      Get.snackbar(
        'weight update',
        'the weight did not update',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
