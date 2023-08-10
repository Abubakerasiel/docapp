import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class AdminTimeEdit extends StatefulWidget {
  const AdminTimeEdit({super.key});

  @override
  State<AdminTimeEdit> createState() => _AdminTimeEditState();
}

class _AdminTimeEditState extends State<AdminTimeEdit> {
  @override
  Widget build(BuildContext context) {
    final ReservationController controller = Get.put(ReservationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
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
                },
                child: const Text('add Monday')),
            ElevatedButton(
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
                },
                child: const Text('remove Monday ')),
            //////////// /// //////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('add 1 hour to satruday')),
            ElevatedButton(
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
                },
                child: const Text('remove 1 from Satruday ')),

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('add 2 hour to satruday')),
            ElevatedButton(
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
                },
                child: const Text('remove 2 from Satruday ')),
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('add 2 hour to sunday')),
            ElevatedButton(
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
                },
                child: const Text('remove 2 from sunday ')),

            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('add 2 hour to monday')),
            ElevatedButton(
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
                },
                child: const Text('remove 2 from monday ')),

            ///////// ////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('add 2 hour to tuesday')),
            ElevatedButton(
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
                },
                child: const Text('remove 2 from tuesday ')),
            /////////////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('add tuesday')),
            ElevatedButton(
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
                },
                child: const Text('remove tuesday ')),
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
                onPressed: () async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_sunday': true});
                    await controller.getDataFromFirestore();

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
                },
                child: const Text('add sunday')),
            ElevatedButton(
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
                },
                child: const Text('remove sunday ')),
            ///////////    ///////////////////////////////////////////////////////////////////////////////////////////
            ElevatedButton(
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
                },
                child: const Text('Disable Monday')),
            ElevatedButton(
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
                },
                child: const Text('Enable Monday ')),
          ],
        ),
      ),
    );
  }
}
