import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:maps_launcher/maps_launcher.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';

class ReservationScreen1 extends StatefulWidget {
  @override
  State<ReservationScreen1> createState() => _ReservationScreen1State();
}

class _ReservationScreen1State extends State<ReservationScreen1> {
  final ReservationController controller = Get.put(ReservationController());
  DateTime today = DateTime.now();
  void _onDaySelectd(DateTime day, DateTime focusedDay) {
    if (day.weekday == 3 || day.weekday == 4 || day.weekday == 5) {
      Get.snackbar(
        'Worng Day',
        'Please Select Aday from Saturday To Tuesday',
        backgroundColor: Colors.red,
      );
    } else {
      setState(() {
        today = day;
        controller.selectedDate.value = today;
      });
    }
  }

  @override
  void initState() {
    controller.fetchDates();
    super.initState();
    // controller.retrieveUserData(userId);
  }

  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // DateTime calendarDate =
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    bool isButtonTapped = false;
    //  DateTime today = DateTime.now();
    ReservationController controller = Get.put(ReservationController());

    return Scaffold(
      appBar: AppBar(
        title: Text('${today.toString().split('')[0]}'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image(
                    //   image: AssetImage(
                    //     'assets/back_btn.png',
                    //   ),
                    //   width: 30,
                    // ),
                    // Image(
                    //   image: AssetImage('assets/profile.png'),
                    //   width: 30,
                    // )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(' selected day :' + today.toString().split(' ')[0]),
                ToggleSwitch(
                  minWidth: MediaQuery.of(context).size.width,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [AppConstants.appColor],
                    [AppConstants.appColor]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: AppConstants.appColor,
                  borderColor: [AppConstants.appColor, AppConstants.appColor],
                  borderWidth: 1,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: const ['Diet plan', 'Booking'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Next available :',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'july 8 2023',
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: AppConstants.appFont),
                ),
                TableCalendar(
                    calendarStyle: const CalendarStyle(
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
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    onDaySelected: _onDaySelectd,
                    availableGestures: AvailableGestures.all,
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                    rowHeight: 43,
                    //  locale: 'en_US',
                    focusedDay: today,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 3, 14))
                // ElevatedButton(
                //   onPressed: () async {
                //     await controller.DatePicker(context);
                //   },
                //   child: Text(
                //     controller.selectedDate.value != null
                //         ? 'Selected Date: ${controller.selectedDate.value!.toString().split(' ')[0]}'
                //         : 'Select Date'.tr,
                //   ),
                // ),
                // SizedBox(height: 20),
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
                ,
                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('4:00 PM'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('4:30 PM'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('5:00 PM'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('5:30 PM'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTapDown: (_) {
                        // When the tap down event occurs, set the button color to blue
                        setState(() {
                          isButtonTapped = true;
                        });
                      },
                      onTapUp: (_) {
                        // When the tap up event occurs, set the button color back to the original color (grey)
                        setState(() {
                          isButtonTapped = false;
                        });
                      },
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: isButtonTapped ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('6:00 PM'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('6:30 PM'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('7:00 PM'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('7:30 PM'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('8:00 PM'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // final DateTime selectedDateTime = DateTime(
                        //   today.year,
                        //   today.month,
                        //   today.day,
                        //   pickedTime.hour,
                        //   pickedTime.minute,
                        // );
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            8,
                            30,
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: const Text('8:30 PM'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          controller.makeReservation(context);
                        },
                        child: Text('make reser')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
