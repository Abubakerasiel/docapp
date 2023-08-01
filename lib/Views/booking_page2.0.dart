//import 'package:url_launcher/url_launcher.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  //bool isButtonTapped = true;
  final ReservationController controller = Get.put(ReservationController());
  List<bool> _isButtonTappedList = List.generate(10, (index) => false);
  // int _selectedIndex = -1;
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
    //  DateTime today = DateTime.now();
    ReservationController controller = Get.put(ReservationController());

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${today.toString().split('')[0]}'),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: 15,
                        child: Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Get.to(
                            UserDetailsPage(
                              userId: controller.user!.uid,
                            ),
                            arguments: controller.user!.uid);
                      },
                      icon: Icon(
                        Icons.person,
                        size: 30,
                        color: AppConstants.appColor,
                      ),
                    )
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
                // Text(' selected day :' + today.toString().split(' ')[0]),
                // ToggleSwitch(
                //   minWidth: MediaQuery.of(context).size.width,
                //   cornerRadius: 20.0,
                //   activeBgColors: [
                //     [AppConstants.appColor],
                //     [AppConstants.appColor]
                //   ],
                //   activeFgColor: Colors.white,
                //   inactiveBgColor: Colors.white,
                //   inactiveFgColor: AppConstants.appColor,
                //   borderColor: [AppConstants.appColor, AppConstants.appColor],
                //   borderWidth: 1,
                //   initialLabelIndex: 1,
                //   totalSwitches: 2,
                //   labels: const ['Diet plan', 'Booking'],
                //   radiusStyle: true,
                //   onToggle: (index) {
                //     print('switched to: $index');
                //   },
                // ),
                Text(
                  'Booking Date:',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   'Next available :',
                //   style: TextStyle(
                //       fontSize: 14,
                //       color: AppConstants.appColor,
                //       fontWeight: FontWeight.w600,
                //       fontFamily: AppConstants.appFont),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   'july 8 2023',
                //   style: TextStyle(
                //       fontSize: 14,
                //       fontStyle: FontStyle.italic,
                //       color: Colors.grey,
                //       fontWeight: FontWeight.w300,
                //       fontFamily: AppConstants.appFont),
                // ),
                TableCalendar(
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                          color: Color(0xff2282B7), shape: BoxShape.circle),
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
                const SizedBox(height: 10),
                Text(
                  'Booking Time:',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(0, '4:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          4,
                          00,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                    _buildButton(1, '4:30', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          4,
                          30,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(2, '5:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          5,
                          00,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                    _buildButton(3, '5:30', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          5,
                          30,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(4, '6:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          6,
                          00,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                    _buildButton(5, '6:30', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          6,
                          30,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(6, '7:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          7,
                          00,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                    _buildButton(7, '7:30', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          7,
                          30,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(8, '8:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          8,
                          30,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                    _buildButton(9, '8:30', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          8,
                          30,
                        );
                      });
                      // Function to be executed when Button 1 is pressed.
                    }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff2282B7))),
                        onPressed: () {
                          controller.makeReservation(context);
                        },
                        child: const Text('Confirm Booking')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(int index, String buttonText, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_isButtonTappedList[index]) {
            // If the clicked button is already selected, change it back to gray.
            _isButtonTappedList[index] = false;
          } else {
            // If a new button is clicked, update the selected state.
            // First, reset the state of all buttons.
            for (int i = 0; i < _isButtonTappedList.length; i++) {
              _isButtonTappedList[i] = false;
            }
            // Then, set the clicked button to be selected.
            _isButtonTappedList[index] = true;
          }
        });

        // Execute the callback function when the button is tapped.
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: 135,
        height: 35,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _isButtonTappedList[index]
              ? Color(0xff2282B7)
              : Color(0xffF1F1F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color:
                _isButtonTappedList[index] ? Color(0xffF1F1F1) : Colors.black,
          ),
        ),
      ),
    );
  }
}
