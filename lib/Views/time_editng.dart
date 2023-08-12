import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/statemnet_page.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';
import 'home.dart';

class AdminTimeEdit extends StatefulWidget {
  const AdminTimeEdit({super.key});

  @override
  State<AdminTimeEdit> createState() => _AdminTimeEditState();
}

class _AdminTimeEditState extends State<AdminTimeEdit> {
  @override
  Widget build(BuildContext context) {
    final ReservationController controller = Get.put(ReservationController());
    void _onItemTapped(int index) async {
      if (index == 0) {
        Get.off(HomeScreen1(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        Get.off(const StatmentPage(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        //   await _reservationController.getDataFromFirestore();

        // If 'Business' is tapped, navigate to the sign-in screen
      } else if (index == 2) {
        //   await _reservationController.getDataFromFirestore();

        // If 'Business' is tapped, navigate to the sign-in screen
      }
    }

    return Scaffold(
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,

          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'saturdayDisabled': false,
                    });
                    await controller.getDataFromFirestore();
                    //controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'monday has been enabled  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to enable monday ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Enable Saturday ')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_satruday': true});
                    await controller.getDataFromFirestore();
                    // print(controller.isSaturday1H.value);

                    //  controller.isSaturday.value = true;
                    // controller.satL.value = true;

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'an Hour has been addit to saturday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time  update',
                      'the hour has  not been addit to sturday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 1 hour to satruday')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_satruday': true, 'is_saturday2h': true});
                    await controller.getDataFromFirestore();
                    log(controller.isSaturday1H.value.toString());

                    //  controller.isSaturday.value = true;
                    // controller.satL.value = true;

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '2 hours has been addit to saturday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      '2 hours has not been addit to saturday ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 2 hours to satruday')),

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'sundayDisabled': false,
                    });
                    await controller.getDataFromFirestore();
                    //controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'monday has been enabled  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to enable monday ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Enable Sunday ')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_sunday': true});
                    await controller.getDataFromFirestore();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '1 hour has been addit to sunday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to add the hour  ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 1 hour to  sunday')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_sunday': true, 'is_sunday2h': true});
                    await controller.getDataFromFirestore();
                    log(controller.isSaturday1H.value.toString());

                    //  controller.isSaturday.value = true;
                    // controller.satL.value = true;

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '2 hours has been addit to sunday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      ' faild to add 2 hours  sunday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 2 hours to sunday')),

            //////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'mondayDisabled': false,
                    });
                    await controller.getDataFromFirestore();
                    //controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'monday has been enabled  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to enable monday ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Enable Monday ')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'is_monday': true,
                    });
                    await controller.getDataFromFirestore();
                    //  controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'An Hour has been add to monday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'faild to add an hour to monday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add An Hour to  Monday')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_monday': true, 'is_monday2h': true});
                    await controller.getDataFromFirestore();
                    log(controller.isSaturday1H.value.toString());

                    //  controller.isSaturday.value = true;
                    // controller.satL.value = true;

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '2 hours has been addit to monday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to add 2 hours to monday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 2 hours to monday')),

            ////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'tuesdayDisabled': false,
                    });
                    await controller.getDataFromFirestore();
                    //controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'monday has been enabled  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to enable monday ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Enable Tuesday ')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_tuesday': true});
                    await controller.getDataFromFirestore();
                    // print(controller.isSaturday1H.value);

                    //  controller.isSaturday.value = true;
                    // controller.satL.value = true;

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '1 hour has been addit to tuesday  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to add the hour',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 1 hour to  tuesday')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_tuesday': true, 'is_tuesday2h': true});
                    await controller.getDataFromFirestore();
                    // print(controller.isSaturday1H.value);

                    //  controller.isSaturday.value = true;
                    // controller.satL.value = true;

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '2 hours has been addit to tuesday  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'faild to add 2 hours ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('add 2 hours to tuesday')),

            /////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'saturdayDisabled': true,
                    });
                    await controller.getDataFromFirestore();
                    //  controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time  update',
                      'monday has been disabled successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time  update',
                      'failed to disable monday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Disable Saturday')),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'is_satruday': false,
                    });
                    await controller.getDataFromFirestore();
                    log(controller.isSaturday1H.value.toString());

                    //   controller.isSaturday.value = false;
                    // controller.isSaturday = false;
                    // controller.satL.value = false;
                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'the edit hour has been removed from saturday ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'the edit hour has not been removed from saturday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 1 hour from Satruday ')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_satruday': false, 'is_saturday2h': false});
                    await controller.getDataFromFirestore();
                    log(controller.isSaturday1H.value.toString());

                    //   controller.isSaturday.value = false;
                    // controller.isSaturday = false;
                    // controller.satL.value = false;
                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'the addit 2 house has been removed successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'the addit 2 house has not been removed ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 2 hours  from Saturday ')),

            /////////////////////////////////////////////////////////////////////////////////////////////

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'sundayDisabled': true,
                    });
                    await controller.getDataFromFirestore();
                    //  controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time  update',
                      'monday has been disabled successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time  update',
                      'failed to disable monday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Disable Sunday')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'is_sunday': false,
                    });
                    await controller.getDataFromFirestore();

                    // Show a success message
                    Get.snackbar(
                      'Time  update',
                      'the addit hour has been removed from sunday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to remove the hour ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 1 hour from sunday ')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_sunday': false, 'is_sunday2h': false});
                    await controller.getDataFromFirestore();
                    //  print(controller.isSaturday1H.value);

                    //   controller.isSaturday.value = false;
                    // controller.isSaturday = false;
                    // controller.satL.value = false;
                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '2 hours addit to sunday has been removed  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'faild to removed  2 hours to sunday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 2 hours from sunday ')),

            ///////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'mondayDisabled': true,
                    });
                    await controller.getDataFromFirestore();
                    //  controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'monday has been disabled successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to disable monday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Disable Monday')),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'is_monday': false,
                    });
                    await controller.getDataFromFirestore();
                    //controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'the Edit hour has been removed ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'the edited hour was not removed',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 1 hour on Monday ')),
            //////////// /// //////////////////////////////////////////////////////////////////////////////////////////////

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_monday': false, 'is_monday2h': false});
                    await controller.getDataFromFirestore();
                    // print(controller.isSaturday1H.value);

                    //   controller.isSaturday.value = false;
                    // controller.isSaturday = false;
                    // controller.satL.value = false;
                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      '2 hours addit to monday has been removed  successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'failed to remove the 2 hours ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 2 hours from monday ')),

            ///////// ////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'tuesdayDisabled': true,
                    });
                    await controller.getDataFromFirestore();
                    //  controller.onInit();

                    // Show a success message
                    Get.snackbar(
                      'Time  update',
                      'monday has been disabled successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time  update',
                      'failed to disable monday',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Disable Tuesday')),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'is_tuesday': false,
                    });
                    await controller.getDataFromFirestore();
                    // print(controller.isSaturday1H.value);

                    //   controller.isSaturday.value = false;
                    // controller.isSaturday = false;
                    // controller.satL.value = false;
                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'the addit hour has been removed from tuesday successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'faild to remove the hour ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 1 hour from tuesday ')),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_tuesday': false, 'is_tuesday2h': false});
                    await controller.getDataFromFirestore();
                    // print(controller.isSaturday1H.value);

                    //   controller.isSaturday.value = false;
                    // controller.isSaturday = false;
                    // controller.satL.value = false;
                    // Show a success message
                    Get.snackbar(
                      'Time update',
                      'the 2 hours addit to tuesday has been removed successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'Time update',
                      'faild to remove the 2 hours ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('remove 2 hours from tuesday ')),
            /////////////////////////////////////////////////////////////////////////////////////////////////////

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            ///////////    ///////////////////////////////////////////////////////////////////////////////////////////

            /////////////////////////////////////////////////////////////////////////////////////////////////////

            ///////////////////////////////////////////////////////////////////////////////////////

            /////////////////////////////////////////////////////////////////////////////////////////
          ],
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
          ],
          currentIndex: 2,
          selectedItemColor: AppConstants.appColor,
          unselectedItemColor: Colors.grey.shade700,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }
}
