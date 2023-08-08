import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class ReservationScreen extends StatefulWidget {
  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final ReservationController controller = Get.put(ReservationController());

  @override
  void initState() {
    controller.fetchDates();
    super.initState();
    // controller.retrieveUserData(userId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reservation Screen'.tr),
        ),
        body: Center(
          child: Obx(
            () => Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await controller.datePicker(context);
                  },
                  child: Text(
                    controller.selectedDate.value != null
                        ? 'Selected Date: ${controller.selectedDate.value!.toString().split(' ')[0]}'
                        : 'Select Date'.tr,
                  ),
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () async {
                //     await controller.TimePicker(context);
                //   },
                //   child: Text(
                //     controller.selectedTime.value != null
                //         ? 'Selected Time: ${controller.selectedTime.value!.format(context)}'
                //         : 'Select Time',
                //   ),
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.makeReservation(context);
                  },
                  child: Text('Make Reservation'.tr),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.fetchDates();
                  },
                  child: Text('Show Reservations'.tr),
                ),
                Expanded(
                    child: Obx(
                  () => ListView.builder(
                    itemCount: controller.dates.length,
                    itemBuilder: (context, index) {
                      final date = controller.dates[index].data();

                      // Check for null values before extracting data
                      final timestamp = date['selectedDate'] as Timestamp?;

                      // final timestamp2 = date['selectedTime'];
                      final userName = date['userName'] as String?;
                      final userPhone = date['phone'] as String?;

                      if (timestamp != null && userName != null) {
                        final dateTime = timestamp.toDate();
                        // Convert Timestamp to DateTime
                        // final time = timestamp2.toString();
                        final formattedDateTime = controller.formatDateTime(
                            dateTime, userName, userPhone);

                        return Column(children: [
                          Text(formattedDateTime),
                          ElevatedButton(
                              onPressed: () {
                                controller.deleteDateAndReplaceIt(
                                    controller.dates[index].id);
                                controller.fetchDates();
                              },
                              child: Text('delete date'.tr))
                        ]);
                      } else {
                        return Container(); // Skip rendering if data is null
                      }
                    },
                  ),
                )),

                TextButton(
                  onPressed: () {
                    MapsLauncher.launchQuery(
                        'Villa No. 48, 2nd Floor, Flat 6, 105th Street, El Horreya Sq, Maadi, Cairo Governorate 11728');
                  },
                  child: Text('Open Google Maps'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
