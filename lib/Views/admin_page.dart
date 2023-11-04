//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutterappoinmentapp/Views/constanst.dart';
import 'package:flutterappoinmentapp/Views/doctor_calender.dart';
import 'package:flutterappoinmentapp/Views/statemnet_page.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as tl;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/booking_controller.dart';
import 'booking_page2.0.dart';

class DatesList extends StatefulWidget {
  const DatesList({super.key, required this.dates});

  final List dates;

  @override
  State<DatesList> createState() => _DatesListState();
}

class _DatesListState extends State<DatesList> {
  final currentUser = tl.FirebaseAuth.instance.currentUser;
  current() {
    if (currentUser!.uid == 'TS7icvWb0PPYY90qJ4MiZY16oyp1') {
      return false;
    }
    return true;
  }

  current2() {
    if (currentUser!.uid == 'TS7icvWb0PPYY90qJ4MiZY16oyp1') {
      return true;
    }

    return false;
  }

  bool isLoading = true;
  final ReservationController controller = Get.put(ReservationController());
  Future<void> _loadData() async {
    // Simulate an asynchronous delay with Future.delayed
    await Future.delayed(const Duration(seconds: 1));

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
    void _onItemTapped(int index) async {
      if (index == 0) {
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        Get.off(() => const StatmentPage(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
      } else if (index == 2) {
        Get.off(() => const AdminTimeEdit(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
      } else if (index == 3) {
        Get.off(() => const BookingScreen(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
      }
    }

    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth > 500 ? 400 : double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Expanded(
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('dates')
                                  .orderBy('selectedDate', descending: false)
                                  .where('selectedDate',
                                      isGreaterThanOrEqualTo: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        00,
                                        00,
                                      ))
                                  .where('selectedDate',
                                      isLessThanOrEqualTo: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        00,
                                        00,
                                      ).add(Duration(days: 1)))
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }

                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'No Appoimnets Yet'.tr,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ); // Skip r;
                                }
                                return ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: snapshot.data!.docs.length,
                                  // reverse: true,
                                  itemBuilder: (context, index) {
                                    //   controller.fetchAllDates();
                                    final date = snapshot.data!.docs[index]
                                        .data() as Map;
                                    final documents = snapshot.data!.docs;
                                    final document = documents[index];
                                    final documentID = document.id;

                                    // Check for null values before extracting data
                                    final timestamp =
                                        date['selectedDate'] as Timestamp?;

                                    // final timestamp2 = date['selectedTime'];
                                    final userName =
                                        date['userName'] as String?;
                                    final userPhone = date['phone'] as String?;
                                    final userID3 = date['userId'] as String?;

                                    if (timestamp != null &&
                                        userName != null &&
                                        userPhone != null) {
                                      final dateTime = timestamp.toDate();

                                      String formattedTime = DateFormat.jm()
                                          .format(dateTime
                                              .add(const Duration(hours: 1)));
                                      String formattedDate =
                                          DateFormat("EEE ,d MMM , ''yyyy")
                                              .format(dateTime);

                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppConstants.appColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    Get.to(
                                                        () => UserDetailsPage(
                                                              userId: userID3!,
                                                            ),
                                                        arguments: userID3,
                                                        curve: Curves.easeInOut,
                                                        duration: Duration(
                                                            seconds: 1),
                                                        transition:
                                                            Transition.fadeIn);
                                                  },
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Icon(Icons.person),
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () async {
                                                            Get.to(
                                                                () =>
                                                                    UserDetailsPage(
                                                                      userId:
                                                                          userID3!,
                                                                    ),
                                                                arguments:
                                                                    userID3,
                                                                curve: Curves
                                                                    .easeInOut,
                                                                duration:
                                                                    Duration(
                                                                        seconds:
                                                                            1),
                                                                transition:
                                                                    Transition
                                                                        .fadeIn);
                                                          },
                                                          child: Text(
                                                              'Name: $userName',
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              )),
                                                        ),
                                                        Text(
                                                            'Phone Number: $userPhone',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      size: 20,
                                                      Icons
                                                          .calendar_month_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      " $formattedDate   ",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    const Icon(
                                                      size: 20,
                                                      Icons
                                                          .access_time_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                        ' ${formattedTime.toString().padLeft(2, '0')}'),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                current2()
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    const MaterialStatePropertyAll(
                                                                        Colors
                                                                            .greenAccent),
                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side: const BorderSide(
                                                                        color: Colors
                                                                            .greenAccent))),
                                                              ),
                                                              onPressed: () {
                                                                controller
                                                                    .ConfirmDate(
                                                                        documentID);
                                                              },
                                                              child: Text(
                                                                  'Confirm Date'
                                                                      .tr)),
                                                          ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    const MaterialStatePropertyAll(
                                                                        Colors
                                                                            .redAccent),
                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side: const BorderSide(
                                                                        color: Colors
                                                                            .redAccent))),
                                                              ),
                                                              onPressed: () {
                                                                controller
                                                                    .deleteDate(
                                                                        documentID);
                                                                //controller.getTodayAppointments();
                                                              },
                                                              child: Text(
                                                                  'Cancel Date'
                                                                      .tr)),
                                                        ],
                                                      )
                                                    : const SizedBox()
                                              ]),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            'No Appoimnets Yet'.tr,
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                      ); // Skip rendering if data is null
                                    }
                                  },
                                );
                              }))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => const DoctorCalender(),
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 500),
                  transition: Transition.native);
            },
            child: Icon(Icons.book_rounded)),
      ),
      bottomNavigationBar: current()
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
                  icon: const Icon(Icons.post_add),
                  label: 'Statement Page'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person_sharp),
                  label: 'Time Editing Page'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.calendar_month_outlined),
                  label: 'Calender Page'.tr,
                ),
              ],
              currentIndex: 0,
              selectedItemColor: AppConstants.appColor,
              unselectedItemColor: Colors.grey.shade700,
              showUnselectedLabels: true,
              onTap: _onItemTapped,
            )
          : SizedBox(),
    );
  }
}
