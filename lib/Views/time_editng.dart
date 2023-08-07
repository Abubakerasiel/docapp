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
                  await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update({
                    'is_monday': true,
                  });
                  await controller.getDataFromFirestore();
                  //  controller.onInit();

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
              child: Text('add Monday')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update({
                    'is_monday': false,
                  });
                  await controller.getDataFromFirestore();
                  //controller.onInit();

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
              child: Text('remove Monday ')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime
                      .doc('WTMfaIqjFuL686hKuK9h')
                      .update({'is_satruday': true});
                  await controller.getDataFromFirestore();
                  print(controller.isSaturday.value);

                  //  controller.isSaturday.value = true;
                  // controller.satL.value = true;

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
              child: Text('add satruday')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update({
                    'is_satruday': false,
                  });
                  await controller.getDataFromFirestore();
                  print(controller.isSaturday.value);

                  //   controller.isSaturday.value = false;
                  // controller.isSaturday = false;
                  // controller.satL.value = false;
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
              child: Text('remove Satruday ')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime
                      .doc('WTMfaIqjFuL686hKuK9h')
                      .update({'is_tuesday': true});
                  await controller.getDataFromFirestore();
                  print(controller.isSaturday.value);

                  //  controller.isSaturday.value = true;
                  // controller.satL.value = true;

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
              child: Text('add tuesday')),
          ElevatedButton(
              onPressed: () async {
                try {
                  // Save the updated weight to Firestore
                  await controller.docTime.doc('WTMfaIqjFuL686hKuK9h').update({
                    'is_tuesday': false,
                  });
                  await controller.getDataFromFirestore();
                  print(controller.isSaturday.value);

                  //   controller.isSaturday.value = false;
                  // controller.isSaturday = false;
                  // controller.satL.value = false;
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
              child: Text('remove tuesday ')),
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
                  await controller.getDataFromFirestore();

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
          Obx(() => controller.isSaturday.value ? Text('he') : SizedBox()),
        ],
      ),
    );
  }
}
