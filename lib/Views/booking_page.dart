import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappoinmentapp/constants.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
  DateTime today =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime calendarDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Reservation Screen'.tr),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Obx(
              () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: AssetImage('assets/back_btn.png',),width: 30,),
                    Image(image: AssetImage('assets/profile.png'),width: 30,)
                  ],
                ),
                SizedBox(height: 10,),
                ToggleSwitch(
                  minWidth: MediaQuery.of(context).size.width,
                  cornerRadius: 20.0,
                  activeBgColors: [[AppConstants.appColor!], [AppConstants.appColor!]],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: AppConstants.appColor,
                  borderColor: [AppConstants.appColor,AppConstants.appColor],
                  borderWidth: 1,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: ['Diet plan', 'Booking'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
                SizedBox(height: 10,),
                Text(
                  'Next available :',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
                SizedBox(height: 5,),
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
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(today, day);
                  },
                  calendarFormat: CalendarFormat.month,
                  onFormatChanged: (format) {
                    // setState(() {
                    //   _calendarFormat = format;
                    // });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    // setState(() {
                    //   _selectedDay = selectedDay;
                    //   _focusedDay = focusedDay; // update `_focusedDay` here as well
                    // });
                  },
                ),

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
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //     controller.makeReservation(context);
                //   },
                //   child: Text('Make Reservation'.tr),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     controller.fetchDates();
                //   },
                //   child: Text('Show Reservations'.tr),
                // ),
                // Expanded(
                //     child: Obx(
                //           () => ListView.builder(
                //         itemCount: controller.dates.length,
                //         itemBuilder: (context, index) {
                //           final date = controller.dates[index].data();
                //
                //           // Check for null values before extracting data
                //           final timestamp = date['selectedDate'] as Timestamp?;
                //
                //           // final timestamp2 = date['selectedTime'];
                //           final userName = date['userName'] as String?;
                //           final userPhone = date['phone'] as String?;
                //
                //           if (timestamp != null && userName != null) {
                //             final dateTime = timestamp.toDate();
                //             // Convert Timestamp to DateTime
                //             // final time = timestamp2.toString();
                //             final formattedDateTime = controller.formatDateTime(
                //                 dateTime, userName, userPhone);
                //
                //             return Column(children: [
                //               Text(formattedDateTime),
                //               ElevatedButton(
                //                   onPressed: () {
                //                     controller.deleteDateAndRpalceIt(
                //                         controller.dates[index].id);
                //                     controller.fetchDates();
                //                   },
                //                   child: Text('delete date'.tr))
                //             ]);
                //           } else {
                //             return Container(); // Skip rendering if data is null
                //           }
                //         },
                //       ),
                //     )),
                // TextButton(
                //   onPressed: () {
                //     MapsLauncher.launchQuery(
                //         'Villa No. 48, 2nd Floor, Flat 6, 105th Street, El Horreya Sq, Maadi, Cairo Governorate 11728');
                //   },
                //   child: Text('Open Google Maps'.tr),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
