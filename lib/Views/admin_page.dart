//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/Statemnet_page.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class DatesList extends StatefulWidget {
  const DatesList({super.key, required this.dates});

  final List dates;

  @override
  State<DatesList> createState() => _DatesListState();
}

class _DatesListState extends State<DatesList> {
  final ReservationController controller = Get.put(ReservationController());
  @override
  void initState() {
    controller.fetchAllDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  RxString a = txt.text.obs;
    final ReservationController controller = Get.put(ReservationController());
    // final User user=FirebaseAuth.instance.currentUser;
    // final  user = FirebaseAuth.instance.currentUser;

    // Render a specific page or widget
    return MaterialApp(
      home: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller.fetchAllDates();
            },
            child: Text('Show Reservations'.tr),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Obx(
            () => ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: controller.dates.length,
              // reverse: true,
              itemBuilder: (context, index) {
                //   controller.fetchAllDates();
                final date = controller.dates[index].data();

                // Check for null values before extracting data
                final timestamp = date['selectedDate'] as Timestamp?;

                // final timestamp2 = date['selectedTime'];
                final userName = date['userName'] as String?;
                final userPhone = date['phone'] as String?;
                final userID3 = date['userId'] as String?;

                if (timestamp != null &&
                    userName != null &&
                    userPhone != null) {
                  final dateTime = timestamp.toDate();
                  final hour = dateTime.hour + 1;
                  final a = hour.toString();
                  // Convert Timestamp to DateTime
                  // final time = timestamp2.toString();
                  // final formattedDateTime =
                  //     controller.formatDateTime(dateTime, userName, userPhone);

                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Text(
                            " ${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}   Time ${a.toString().padLeft(2, '0')}/${dateTime.minute.toString().padLeft(2, '0')}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await controller.retrieveUserData(userID3!);

                            Get.to(UserDetailsPage(), arguments: userID3);
                          },
                          child: Text(userName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              )),
                        ),
                        Text(userPhone,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  controller
                                      .deleteDate(controller.dates[index].id);
                                  controller.fetchAllDates();
                                },
                                child: Text('delete date'.tr)),
                          ],
                        ),
                      ]);
                } else {
                  return Container(
                    child: Text('hi'),
                  ); // Skip rendering if data is null
                }
              },
            ),
          )),
          ElevatedButton(
              onPressed: () {
                Get.to(StatmentPage());
              },
              child: Text('Go to Statemnst page'.tr))
        ],
      ),
    );
  }
}
