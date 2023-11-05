//import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterappoinmentapp/Views/home.dart';
import 'package:flutterappoinmentapp/Views/statemnet_page.dart';
import 'package:flutterappoinmentapp/Views/time_editng.dart';
import 'package:flutterappoinmentapp/Views/user_appoiment.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';

import 'package:flutterappoinmentapp/Wedgits/time_showing3.dart';
import 'package:flutterappoinmentapp/Wedgits/time_showing4.dart';
import 'package:flutterappoinmentapp/Wedgits/time_showing5.dart';
import 'package:flutterappoinmentapp/Wedgits/time_shwoing6.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Wedgits/time_showing2.dart';
import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';
import 'constanst.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  //bool isButtonTapped = true;
  Set<int> disabledButtons = {};

  // Initialize a Map to track the disabled state for each date
  Map<DateTime, bool> disabledDates = {};
  int selectedTimeIndex = -1;

  final ReservationController controller = Get.put(ReservationController());
  final List<bool> _isButtonTappedList = List.generate(1000, (index) => false);
  // int _selectedIndex = -1;
  DateTime today = DateTime.now();
  void _onDaySelectd(DateTime day, DateTime focusedDay) {
    void call() async {
      await controller.getDataFromFirestore();
    }

    setState(() {
      x = true;
    });
    setState(() {
      // Reset the disabled state for the selected date
      if (disabledDates.containsKey(today)) {
        disabledDates[today] = false;
      }
      selectedTimeIndex = -1; // Reset the selected time index
    });
    call();
    setState(() {
      selectedTimeIndex = -1; // Reset the selected time index
    });

    // Set this variable based on your condition

    if (day.weekday == 5) {
      Get.snackbar(
          titleText: Text(
            'This Day is off'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          'This Day is off'.tr,
          'Please Select A Day from Saturday To Tuesday'.tr,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          messageText: Text(
            'Please Select A Day from Saturday To Tuesday'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          duration: Duration(seconds: 2));
    }

    // }
    else if (day.weekday == 6 && !controller.disableSaturday.value) {
      void call() async {
        await controller.getDataFromFirestore();
      }

      setState(() {
        call();
        today = day;
        controller.selectedDate.value = today;
        controller.sundayTimeShowing.value = false;
        controller.mondayTimeShowing.value = false;
        controller.tuesTimeShowing.value = false;
      });
    } else if (day.weekday == 3 && !controller.disableWednesday.value) {
      void call() async {
        await controller.getDataFromFirestore();
      }

      setState(() {
        call();
        today = day;
        controller.selectedDate.value = today;
        controller.sundayTimeShowing.value = false;
        controller.mondayTimeShowing.value = false;
        controller.tuesTimeShowing.value = false;
        controller.wednesdayTimeShowing.value = true;
        controller.thursdayTimeShowing.value = false;
      });
    } else if (day.weekday == 4 && !controller.disableThursday.value) {
      void call() async {
        await controller.getDataFromFirestore();
      }

      setState(() {
        call();
        today = day;
        controller.selectedDate.value = today;
        controller.sundayTimeShowing.value = false;
        controller.mondayTimeShowing.value = false;
        controller.tuesTimeShowing.value = false;
        controller.wednesdayTimeShowing.value = false;
        controller.thursdayTimeShowing.value = true;
      });
    } else if (day.weekday == 7 && !controller.disableSunday.value) {
      void call() async {
        await controller.getDataFromFirestore();
      }

      setState(() {
        call();
        today = day;
        controller.selectedDate.value = today;
        controller.mondayTimeShowing.value = false;
        controller.tuesTimeShowing.value = false;
        controller.sundayTimeShowing.value = true;
        controller.wednesdayTimeShowing.value = false;
        controller.thursdayTimeShowing.value = false;
      });
    } else if (day.weekday == 1 && !controller.disableMonday.value) {
      void call() async {
        await controller.getDataFromFirestore();
      }

      // Check if Monday should be disabled
      setState(() {
        call();
        today = day;
        controller.selectedDate.value = today;
        controller.mondayTimeShowing.value = true;
        controller.tuesTimeShowing.value = false;
        controller.sundayTimeShowing.value = false;
        controller.wednesdayTimeShowing.value = false;
        controller.thursdayTimeShowing.value = false;
        // controller.tuesTimeShowing.value = true;
      });
    } else if (day.weekday == 2 && !controller.disableTuesday.value) {
      void call() async {
        await controller.getDataFromFirestore();
      }

      setState(() {
        call();
        today = day;
        controller.selectedDate.value = today;
        controller.mondayTimeShowing.value = false;
        controller.tuesTimeShowing.value = true;
        controller.sundayTimeShowing.value = false;
        controller.wednesdayTimeShowing.value = false;
        controller.thursdayTimeShowing.value = false;
      });
    } else {
      Get.snackbar(
        'This Day is off'.tr,
        'Please Select Another day'.tr,
        messageText: Text(
          'Please Select Another day',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
  }

  int currentIndex = 0;
  bool x = false;
  // ignore: unused_element
  void _startTextChanging(List textList) {
    Future.delayed(const Duration(seconds: 60), () {
      setState(() {
        currentIndex = (currentIndex + 1) % textList.length;
      });
      _startTextChanging(textList);
    });
  }

  @override
  void initState() {
    super.initState();
    controller.getDataFromFirestore();
  }

  final List<String> textList = [
    "Remember , you deserve to be the best version of yourself.".tr,
    "Everyday is a start day, don't give up.".tr,
    "Failure is a phase, not a final result.".tr,
    "10- grams loss, is a success.".tr,
    // Add more texts as needed
  ];

  @override
  Widget build(BuildContext context) {
    ReservationController controller = Get.put(ReservationController());
    HomeController controller2 = Get.put(HomeController());

    // DateTime? selectedDate = controller.selectedDate.value;
    // bool isSelectedDateSat =
    //     selectedDate != null && (selectedDate.weekday == 6);
    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) {
      if (index == 0) {
        Get.off(() => HomeScreen1(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        // If 'Business' is tapped, navigate to the sign-in screen
        // Get.off(BookingScreen());
      } else if (index == 2) {
        Get.off(() => UserDetailsPage(userId: controller.user!.uid),
            arguments: controller.user!.uid,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 3) {
        Get.off(() => const UserAppoimetn(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      }
    }

    void _onItemTapped2(int index) {
      if (index == 0) {
        Get.off(() => HomeScreen1(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        Get.off(() => StatmentPage(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'Business' is tapped, navigate to the sign-in screen
        // Get.off(BookingScreen());
      } else if (index == 2) {
        Get.off(() => AdminTimeEdit(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 3) {
        Get.off(() => const BookingScreen(),
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            transition: Transition.native);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      }
    }
    //  DateTime today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 70,
        elevation: 14,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        title: Text(
          " ${controller.userName}",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.red)
                ], shape: BoxShape.circle, color: Colors.redAccent),
                child: IconButton(
                  onPressed: () => controller2.logOut(),
                  icon: Icon(
                    Icons.logout,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 26,
              )
            ],
          )
        ],
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth > 500 ? 600 : double.infinity,
            child: Obx(
              () => SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Booking Date'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppConstants.appColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppConstants.appFont),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TableCalendar(
                            calendarStyle: const CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  shape: BoxShape.circle),
                              // todayDecoration: BoxDecoration(
                              //     color: Colors.white, shape: BoxShape.circle),
                              weekendTextStyle: TextStyle(color: Colors.red),
                            ),
                            daysOfWeekStyle: const DaysOfWeekStyle(
                              // Weekend days color (Sat,Sun)
                              weekendStyle: TextStyle(color: Colors.red),
                            ),
                            calendarBuilders: const CalendarBuilders(),
                            weekendDays: const [
                              DateTime.wednesday,
                              DateTime.thursday,
                              DateTime.friday
                            ],
                            selectedDayPredicate: (day) =>
                                isSameDay(day, today),
                            onDaySelected: _onDaySelectd,
                            availableGestures: AvailableGestures.all,
                            headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true),
                            rowHeight: 43,
                            //  locale: 'en_US',
                            focusedDay: today,
                            firstDay: DateTime.now(),
                            lastDay: DateTime.utc(2030, 3, 14)),
                        const SizedBox(height: 10),
                        Text(
                          'Booked Times for This Day:'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppConstants.appColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppConstants.appFont),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        x
                            ? StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('dates')
                                    .where('selectedDate',
                                        isGreaterThanOrEqualTo:
                                            controller.selectedDate.value)
                                    .where('selectedDate',
                                        isLessThanOrEqualTo: controller
                                            .selectedDate.value
                                            .add(Duration(days: 1)))
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (snapshot.data!.docs.length == 0) {
                                    return Text(
                                      'All The Times Are Availabe For Booking'
                                          .tr,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    );
                                  }
                                  //    print(controller.selectedDate.value);

                                  // var snap = snapshot.data!.docs[0].data() as Map;

                                  return SizedBox(
                                    height: snapshot.data!.docs.length > 10
                                        ? 200
                                        : 120,
                                    child: GridView(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5),
                                      children:
                                          snapshot.data!.docs.map((document) {
                                        var documentData = document.data()
                                            as Map<String, dynamic>;

                                        // Create a custom widget for each document
                                        return Card(
                                          color: Colors.red,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                  '${DateFormat.jm().format(documentData['selectedDate'].toDate().add(Duration(hours: 1)))} '),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              )
                            : SizedBox(),
                        const SizedBox(height: 10),
                        Text(
                          'Booking Time'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppConstants.appColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppConstants.appFont),
                        ),
                        const SizedBox(height: 10),
                        controller.sundayTimeShowing.value
                            ? TimeShowingSunday(
                                today: today,
                              )
                            : controller.mondayTimeShowing.value
                                ? TimeShowingMonday(
                                    today: today,
                                  )
                                : controller.tuesTimeShowing.value
                                    ? TimeShowingTuesday(
                                        today: today,
                                      )
                                    : controller.wednesdayTimeShowing.value
                                        ? TimeShowingWednesday(today: today)
                                        : controller.thursdayTimeShowing.value
                                            ? TimeShowingThursday(today: today)
                                            : Column(children: [
                                                controller.Sturaday11am.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  14, '11:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    00,
                                                                  ).subtract(Duration(
                                                                          hours:
                                                                              12));
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  15, '11:15',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    15,
                                                                  ).subtract(Duration(
                                                                          hours:
                                                                              12));
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  16, '11:30',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    30,
                                                                  ).subtract(Duration(
                                                                          hours:
                                                                              12));
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  17, '11:45',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    45,
                                                                  ).subtract(Duration(
                                                                          hours:
                                                                              12));
                                                                });
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday12.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  18, '12:00',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    00,
                                                                    00,
                                                                  );
                                                                });
                                                              }),
                                                              _buildButton(
                                                                  19, '12:15',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    00,
                                                                    15,
                                                                  );
                                                                });
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  20, '12:30',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    00,
                                                                    30,
                                                                  );
                                                                });
                                                              }),
                                                              _buildButton(
                                                                  21, '12:45',
                                                                  () {
                                                                setState(() {
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    00,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday1.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  22, '1:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    1,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  23, '1:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    1,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  24, '1:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    1,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  25, '1:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    1,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday2.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  26, '2:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    2,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  27, '2:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    2,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  28, '2:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    2,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  29, '2:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    2,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday3.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  30, '3:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    3,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  31, '3:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    3,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  32, '3:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    3,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  33, '3:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    3,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday4.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  34, '4:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    4,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  35, '4:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    4,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  36, '4:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    4,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  37, '4:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    4,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday5.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  38, '5:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    5,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  39, '5:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    5,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  40, '5:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    5,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  41, '5:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    5,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday6.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  42, '6:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    6,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  43, '6:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    6,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  44, '6:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    6,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  45, '6:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    6,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday7.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  46, '7:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    7,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  47, '7:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    7,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  48, '7:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    7,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  49, '7:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    7,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday8.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  50, '8:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    8,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  51, '8:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    8,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  52, '8:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    8,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  53, '8:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    8,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday9.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  54, '9:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    9,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  55, '9:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    9,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  56, '9:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    9,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  57, '9:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    9,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday10.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  85, '10:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    10,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  59, '10:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    10,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  60, '10:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    10,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  61, '10:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    10,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday11.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  621, '11:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  63, '11:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  64, '11:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  65, '11:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    11,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                                controller.Sturaday12am.value
                                                    ? Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  66, '12:00',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    12,
                                                                    00,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  67, '12:15',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    12,
                                                                    15,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              _buildButton(
                                                                  68, '12:30',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    12,
                                                                    30,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                              _buildButton(
                                                                  69, '12:45',
                                                                  () {
                                                                setState(() {
                                                                  // controller.isButtonTapped.value =
                                                                  //     !controller.isButtonTapped.value;
                                                                  controller
                                                                          .selectedDate
                                                                          .value =
                                                                      DateTime(
                                                                    today.year,
                                                                    today.month,
                                                                    today.day,
                                                                    12,
                                                                    45,
                                                                  );
                                                                });
                                                                // Function to be executed when Button 1 is pressed.
                                                              }),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ChangingTextWidget(textList),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Center(
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.lightBlue)),
                                onPressed: () async {
                                  if (controller.selectedDate.value !=
                                      DateTime.now()
                                          .subtract(Duration(days: 100))) {
                                    controller.makeReservation();
                                  } else {
                                    Get.snackbar('Wrong Date'.tr,
                                        'Please Select A Date'.tr,
                                        backgroundColor: Colors.red,
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                },
                                child: Text('Confirm Booking'.tr)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          controller.user!.uid == 'cM39KfqhQrZi1Hk9vD5V7yRnID92'
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
                      icon: const Icon(Icons.calendar_month_outlined),
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
                  currentIndex: 3,
                  selectedItemColor: AppConstants.appColor,
                  unselectedItemColor: Colors.grey.shade700,
                  showUnselectedLabels: true,
                  onTap: _onItemTapped2,
                )
              : BottomNavigationBar(
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
                      label: 'Booking Page'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person_sharp),
                      label: 'Profile Page'.tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_today_rounded), // New icon
                      label: 'Dates Page'.tr, // Label for the new item
                    ),
                  ],
                  currentIndex: 1,
                  selectedItemColor: AppConstants.appColor,
                  unselectedItemColor: Colors.grey.shade700,
                  showUnselectedLabels: true,
                  onTap: _onItemTapped,
                ),
    );
  }

  Widget _buildButton(int index, String buttonText, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (disabledDates.containsKey(controller.selectedDate.value)) {
            disabledDates[controller.selectedDate.value] =
                !disabledDates[controller.selectedDate.value]!;
          } else {
            disabledDates[controller.selectedDate.value] = true;
          }
        });
        setState(() {
          selectedTimeIndex = index;
          if (_isButtonTappedList[index]) {
            _isButtonTappedList[index] = false;
          } else {
            for (int i = 0; i < _isButtonTappedList.length; i++) {
              _isButtonTappedList[i] = false;
            }

            _isButtonTappedList[index] = true;
          }
        });

        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: 135,
        height: 35,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _isButtonTappedList[index]
              ? const Color(0xff2282B7)
              : const Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: _isButtonTappedList[index]
                ? const Color(0xffF1F1F1)
                : Colors.black,
          ),
        ),
      ),
    );
  }
}

class ChangingTextWidget extends StatefulWidget {
  final List<String> textList;

  const ChangingTextWidget(this.textList, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangingTextWidgetState createState() => _ChangingTextWidgetState();
}

class _ChangingTextWidgetState extends State<ChangingTextWidget> {
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTextChanging();
  }

  @override
  void dispose() {
    _cancelTextChanging();
    super.dispose();
  }

  void _cancelTextChanging() {
    _timer?.cancel();
    _timer = null;
  }

  void _startTextChanging() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.textList.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.textList[currentIndex],
      style: const TextStyle(fontSize: 24),
    );
  }
}
