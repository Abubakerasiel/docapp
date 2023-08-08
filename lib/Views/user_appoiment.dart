import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';

class UserAppoimetn extends StatefulWidget {
  const UserAppoimetn({super.key});

  @override
  State<UserAppoimetn> createState() => _UserAppoimetnState();
}

class _UserAppoimetnState extends State<UserAppoimetn> {
  final ReservationController controller = Get.put(ReservationController());

  @override
  void initState() {
    controller.fetchDates();
    //controller.getTodayAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final currentUser = tl.FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text('.الدخول بالمعاد و ليس اولوية الحضور'),
          const Text(''),
          const Text(
              '. الغاء المعاد بيكون قبلها ب ٢٤ ساعة و فى حالة عدم الغاء المعاد تحسب زيارة'),
          const Text('.حجز المعاد من الابليكشن مفتوح قبل المعاد ب اسبوع'),
          const Text(
              'ل الاستفسار او الشكوى ب برجاء ارساله رساله واتس اب على رقم :01221246631'),
          // ElevatedButton(
          //   onPressed: () {
          //     controller.fetchDates();
          //   },
          //   child: Text('Show Reservations'.tr),
          // ),
          Expanded(
              child: Obx(
            () => ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: controller.dates.length,
              itemBuilder: (context, index) {
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

                  String formattedTime = DateFormat.jm()
                      .format(dateTime.add(const Duration(hours: 1)));
                  String formattedDate =
                      DateFormat("EEE ,d MMM , ''yyyy").format(dateTime);
                  // Convert Timestamp to DateTime
                  // final time = timestamp2.toString();
                  // final formattedDateTime =
                  //     controller.formatDateTime(dateTime, userName, userPhone);

                  return Container(
                    decoration: BoxDecoration(
                      color: AppConstants.appColor,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await controller.retrieveUserData(userID3!);

                                    Get.to(
                                        UserDetailsPage(
                                          userId: userID3,
                                        ),
                                        arguments: userID3);
                                  },
                                  child: const CircleAvatar(
                                    child: Icon(Icons.person),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        await controller
                                            .retrieveUserData(userID3!);

                                        Get.to(
                                            UserDetailsPage(
                                              userId: userID3,
                                            ),
                                            arguments: userID3);
                                      },
                                      child: Text('Name: $userName',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                          )),
                                    ),
                                    Text('Phone Number: $userPhone',
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: 300,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  size: 20,
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  " ${formattedDate}   ",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const Icon(
                                  size: 20,
                                  Icons.access_time_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.none,
                                    ),
                                    ' ${formattedTime.toString().padLeft(2, '0')}'),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.greenAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: Colors.greenAccent))),
                                    ),
                                    onPressed: () {
                                      controller.deleteDate(
                                          controller.dates[index].id);
                                      //    controller.getTodayAppointments();
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
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.redAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  color: Colors.redAccent))),
                                    ),
                                    onPressed: () {
                                      controller.deleteDateAndReplaceIt(
                                          controller.dates[index].id);
                                      controller.fetchAllDates();
                                      //controller.getTodayAppointments();
                                    },
                                    child: Text('Cancel Date'.tr)),
                              ],
                            )
                          ]),
                    ),
                  );
                } else {
                  return Container(); // Skip rendering if data is null
                }
              },
            ),
          )),
          // TextButton(
          //   onPressed: () {
          //     MapsLauncher.launchQuery(
          //         'Villa No. 48, 2nd Floor, Flat 6, 105th Street, El Horreya Sq, Maadi, Cairo Governorate 11728');
          //   },
          //   child: Text('Open Google Maps'.tr),
          // ),
        ],
      ),
    );
  }
}
