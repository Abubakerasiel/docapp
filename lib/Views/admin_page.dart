//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/Statemnet_page.dart';
import 'package:flutterappoinmentapp/Views/constanst.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as tl;
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
  final currentUser = tl.FirebaseAuth.instance.currentUser;
  current() {
    if (currentUser!.uid == 'BP3ONAOGn8WEJm9IevwkUgke15T2') {
      return false;
    }
    return true;
    //else if (currentUser!.uid=='RfY49ef1TtPD7f6spDbaMN7aiKd2'){
    //   return ;
    // }
  }

  current2() {
    if (currentUser!.uid == 'BP3ONAOGn8WEJm9IevwkUgke15T2') {
      return true;
    }
    //else if (currentUser!.uid=='RfY49ef1TtPD7f6spDbaMN7aiKd2'){
    //   return ;
    // }
    return false;
  }

  bool isLoading = true;
  final ReservationController controller = Get.put(ReservationController());
  Future<void> _loadData() async {
    // Simulate an asynchronous delay with Future.delayed
    await Future.delayed(Duration(seconds: 3));

    controller.fetchAllDates();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _loadData();
    //controller.getTodayAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  RxString a = txt.text.obs;
    final ReservationController controller = Get.put(ReservationController());
    // final User user=FirebaseAuth.instance.currentUser;
    // final  user = FirebaseAuth.instance.currentUser;

    // Render a specific page or widget
    return Scaffold(
        body: Padding(
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
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Obx(
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
                              final timestamp =
                                  date['selectedDate'] as Timestamp?;

                              // final timestamp2 = date['selectedTime'];
                              final userName = date['userName'] as String?;
                              final userPhone = date['phone'] as String?;
                              final userID3 = date['userId'] as String?;

                              if (timestamp != null &&
                                  userName != null &&
                                  userPhone != null) {
                                final dateTime = timestamp.toDate();

                                String formattedTime = DateFormat.jm()
                                    .format(dateTime.add(Duration(hours: 1)));
                                String formattedDate =
                                    DateFormat("EEE ,d MMM , ''yyyy")
                                        .format(dateTime);
                                // Convert Timestamp to DateTime
                                // final time = timestamp2.toString();
                                // final formattedDateTime =
                                //     controller.formatDateTime(dateTime, userName, userPhone);

                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppConstants.appColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await controller
                                                      .retrieveUserData(
                                                          userID3!);

                                                  Get.to(
                                                      UserDetailsPage(
                                                        userId: userID3,
                                                      ),
                                                      arguments: userID3);
                                                },
                                                child: CircleAvatar(
                                                  child: Icon(Icons.person),
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextButton(
                                                    onPressed: () async {
                                                      await controller
                                                          .retrieveUserData(
                                                              userID3!);

                                                      Get.to(
                                                          UserDetailsPage(
                                                            userId: userID3,
                                                          ),
                                                          arguments: userID3);
                                                    },
                                                    child: Text(
                                                        'Name: $userName',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        )),
                                                  ),
                                                  Text(
                                                      'Phone Number: $userPhone',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        decoration:
                                                            TextDecoration.none,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   children: [
                                          //     SizedBox(
                                          //       width: 61,
                                          //     ),
                                          //     TextButton(
                                          //       onPressed: () async {
                                          //         await controller
                                          //             .retrieveUserData(userID3!);

                                          //         Get.to(
                                          //             UserDetailsPage(
                                          //               userId: userID3,
                                          //             ),
                                          //             arguments: userID3);
                                          //       },
                                          //       child: Text('Name: $userName',
                                          //           style: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: 15,
                                          //             fontWeight: FontWeight.bold,
                                          //             decoration:
                                          //                 TextDecoration.none,
                                          //           )),
                                          //     ),
                                          //   ],
                                          // ),
                                          // Text('Phone Number: $userPhone',
                                          //     textAlign: TextAlign.start,
                                          //     style: TextStyle(
                                          //       color: Colors.white,
                                          //       fontSize: 15,
                                          //       decoration: TextDecoration.none,
                                          //     )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 1,
                                            width: 300,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                size: 20,
                                                Icons.calendar_month_outlined,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                " ${formattedDate}   ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              Icon(
                                                size: 20,
                                                Icons.access_time_outlined,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                  ' ${formattedTime.toString().padLeft(2, '0')}'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          current2()
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors
                                                                      .greenAccent),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .greenAccent))),
                                                        ),
                                                        onPressed: () {
                                                          controller.deleteDate(
                                                              controller
                                                                  .dates[index]
                                                                  .id);
                                                          //    controller.getTodayAppointments();
                                                          controller
                                                              .fetchAllDates();
                                                        },
                                                        child: Text(
                                                            'Confirm Date'.tr)),
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
                                                          backgroundColor:
                                                              MaterialStatePropertyAll(
                                                                  Colors
                                                                      .redAccent),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .redAccent))),
                                                        ),
                                                        onPressed: () {
                                                          controller
                                                              .deleteDateAndRpalceIt(
                                                                  controller
                                                                      .dates[
                                                                          index]
                                                                      .id);
                                                          controller
                                                              .fetchAllDates();
                                                          //controller.getTodayAppointments();
                                                        },
                                                        child: Text(
                                                            'Cancel Date'.tr)),
                                                  ],
                                                )
                                              : SizedBox()
                                        ]),
                                  ),
                                );
                              } else {
                                return Container(
                                  child: Text('hi'),
                                ); // Skip rendering if data is null
                              }
                            },
                          ),
                        )),
              // ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor:
              //           MaterialStatePropertyAll(AppConstants.appColor),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10),
              //               side: BorderSide(color: AppConstants.appColor))),
              //     ),
              //     onPressed: () {
              //       Get.to(StatmentPage());
              //     },
              //     child: Text('Go to Statemnst page'.tr))
            ],
          ),
        ),
        floatingActionButton: current()
            ? FloatingActionButton(
                child: Icon(
                  Icons.post_add,
                  //   color: AppConstants.appColor,
                ),
                onPressed: () {
                  Get.to(StatmentPage());
                },
              )
            : SizedBox());
  }
}
