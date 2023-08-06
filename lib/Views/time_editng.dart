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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime
                      .doc('WTMfaIqjFuL686hKuK9h')
                      .update({'is_monday': true, 'is_tuesday': true});

                  // Show a success message
                  Get.snackbar(
                    'weight update',
                    'weight updated successulfy ',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.greenAccent,
                    colorText: Colors.white,
                  );
                } catch (error) {
                  // Show an error message if update fails
                  Get.snackbar(
                    'weight update',
                    'the weight did not update',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text('add M &T')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime
                      .doc('WTMfaIqjFuL686hKuK9h')
                      .update({'is_monday': false, 'is_tuesday': false});

                  // Show a success message
                  Get.snackbar(
                    'weight update',
                    'weight updated successulfy ',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.greenAccent,
                    colorText: Colors.white,
                  );
                } catch (error) {
                  // Show an error message if update fails
                  Get.snackbar(
                    'weight update',
                    'the weight did not update',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text('remove M&T ')),
          ElevatedButton(
              onPressed: () async {
                setState(() async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({'is_satruday': true});

                    // Show a success message
                    Get.snackbar(
                      'weight update',
                      'weight updated successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'weight update',
                      'the weight did not update',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                });
              },
              child: Text('add satruday')),
          ElevatedButton(
              onPressed: () async {
                setState(() async {
                  try {
                    // Save the updated weight to Firestore
                    await controller.docTime
                        .doc('WTMfaIqjFuL686hKuK9h')
                        .update({
                      'is_satruday': false,
                    });

                    // Show a success message
                    Get.snackbar(
                      'weight update',
                      'weight updated successulfy ',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 4),
                      backgroundColor: Colors.greenAccent,
                      colorText: Colors.white,
                    );
                  } catch (error) {
                    // Show an error message if update fails
                    Get.snackbar(
                      'weight update',
                      'the weight did not update',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 4),
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                });
              },
              child: Text('remove Satruday ')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime
                      .doc('WTMfaIqjFuL686hKuK9h')
                      .update({'is_sunday': true});

                  // Show a success message
                  Get.snackbar(
                    'weight update',
                    'weight updated successulfy ',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.greenAccent,
                    colorText: Colors.white,
                  );
                } catch (error) {
                  // Show an error message if update fails
                  Get.snackbar(
                    'weight update',
                    'the weight did not update',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text('add sunday')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update({
                    'is_sunday': false,
                  });

                  // Show a success message
                  Get.snackbar(
                    'weight update',
                    'weight updated successulfy ',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.greenAccent,
                    colorText: Colors.white,
                  );
                } catch (error) {
                  // Show an error message if update fails
                  Get.snackbar(
                    'weight update',
                    'the weight did not update',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 4),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text('remove sunday ')),
        ],
      ),
    );
  }
}
