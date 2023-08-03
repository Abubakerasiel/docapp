//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/Statemnet_page.dart';
import 'package:flutterappoinmentapp/Views/constanst.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      home: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     controller.fetchAllDates();
            //   },
            //   child: Text('Show Reservations'.tr),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
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
                    String formattedDate =
                        DateFormat("EEE,d MMM ,''yyyy").format(dateTime);
                    // Convert Timestamp to DateTime
                    // final time = timestamp2.toString();
                    // final formattedDateTime =
                    //     controller.formatDateTime(dateTime, userName, userPhone);

                    return Container(
                      decoration: BoxDecoration(
                        color: AppConstants.appColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 47,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await controller.retrieveUserData(userID3!);

                                    Get.to(
                                        UserDetailsPage(
                                          userId: userID3,
                                        ),
                                        arguments: userID3);
                                  },
                                  child: Text('Name: $userName',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                      )),
                                ),
                              ],
                            ),
                            Text('Phone Number: $userPhone',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: 300,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  " ${formattedDate}   ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                    ),
                                    ' ${a.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} pm'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.greenAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.greenAccent))),
                                    ),
                                    onPressed: () {
                                      controller.deleteDate(
                                          controller.dates[index].id);
                                      controller.fetchAllDates();
                                    },
                                    child: Text('Confirm Date'.tr)),
                                // ElevatedButton(
                                //     style: ButtonStyle(
                                //       backgroundColor: MaterialStatePropertyAll(
                                //           Colors.amberAccent),
                                //       shape: MaterialStateProperty.all<
                                //               RoundedRectangleBorder>(
                                //           RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(18.0),
                                //               side: BorderSide(
                                //                   color: Colors.amberAccent))),
                                //     ),
                                //     onPressed: () {
                                //       controller.deleteDate(
                                //           controller.dates[index].id);
                                //       controller.fetchAllDates();
                                //     },
                                //     child: Text('Cancel Date'.tr)),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.redAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.redAccent))),
                                    ),
                                    onPressed: () {
                                      controller.deleteDate(
                                          controller.dates[index].id);
                                      controller.fetchAllDates();
                                    },
                                    child: Text('Delete Date'.tr)),
                              ],
                            ),
                          ]),
                    );
                  } else {
                    return Container(
                      child: Text('hi'),
                    ); // Skip rendering if data is null
                  }
                },
              ),
            )),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppConstants.appColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: AppConstants.appColor))),
                ),
                onPressed: () {
                  Get.to(StatmentPage());
                },
                child: Text('Go to Statemnst page'.tr))
          ],
        ),
      ),
    );
  }
}
