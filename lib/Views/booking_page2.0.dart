//import 'package:url_launcher/url_launcher.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:flutterappoinmentapp/Views/user_page.dart';
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
  List<bool> _isButtonTappedList = List.generate(15, (index) => false);
  // int _selectedIndex = -1;
  DateTime today = DateTime.now();
  void _onDaySelectd(DateTime day, DateTime focusedDay) {
    if (day.weekday == 3 || day.weekday == 4 || day.weekday == 5) {
      Get.snackbar(
        'Worng Day',
        'Please Select Aday from Saturday To Tuesday',
        backgroundColor: Colors.red,
      );
    } else if (day.weekday == 6) {
      setState(() {
        today = day;
        controller.selectedDate.value = today;
        controller.timeShowing.value = false;
      });
    } else if (day.weekday == 7) {
      setState(() {
        today = day;
        controller.selectedDate.value = today;

        controller.timeShowing2.value = false;
        controller.timeShowing.value = true;
      });
    } else if (day.weekday == 1 || day.weekday == 2) {
      setState(() {
        today = day;
        controller.selectedDate.value = today;
        controller.timeShowing.value = true;

        controller.timeShowing2.value = true;
      });
    } else {
      setState(() {
        today = day;
        controller.selectedDate.value = today;
        controller.timeShowing.value = true;
      });
    }
  }

  int currentIndex = 0;
  void _startTextChanging(List textList) {
    Future.delayed(Duration(seconds: 60), () {
      setState(() {
        currentIndex = (currentIndex + 1) % textList.length;
      });
      _startTextChanging(textList);
    });
  }

  @override
  void initState() {
    controller.fetchDates();
    super.initState();
    // controller.retrieveUserData(userId);
  }

  final List<String> textList = [
    "Remember , you deserve to be the best version of yourself.".tr,
    "Everyday is a start day, don't give up.".tr,
    "Failure is a phase, not a final result.".tr,
    "10- grams loss, is a success.".tr,
    // Add more texts as needed
  ];

  // DateTime calendarDate =
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    ReservationController controller = Get.put(ReservationController());
    void _onItemTapped(int index) {
      if (index == 0) {
        Get.off(UserPage());
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        // If 'Business' is tapped, navigate to the sign-in screen
        // Get.off(BookingScreen());
      } else if (index == 2) {
        Get.off(UserDetailsPage(userId: controller.user!.uid),
            arguments: controller.user!.uid);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      }
    }
    //  DateTime today = DateTime.now();

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
                  'Booking Date:'.tr,
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
                  'Booking Time:'.tr,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
                const SizedBox(height: 10),
                controller.timeShowing.value
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildButton(0, '4:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    8,
                                    00,
                                  );
                                });
                                // Function to be executed when Button 1 is pressed.
                              }),
                              controller.timeShowing2.value
                                  ? _buildButton(9, '8:30', () {
                                      setState(() {
                                        // controller.isButtonTapped.value =
                                        //     !controller.isButtonTapped.value;
                                        controller.selectedDate.value =
                                            DateTime(
                                          today.year,
                                          today.month,
                                          today.day,
                                          8,
                                          30,
                                        );
                                      });
                                      // Function to be executed when Button 1 is pressed.
                                    })
                                  : SizedBox(),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildButton(0, '12:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    12,
                                    00,
                                  );
                                });
                                // Function to be executed when Button 1 is pressed.
                              }),
                              _buildButton(1, '12:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    12,
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
                              _buildButton(2, '1:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    1,
                                    00,
                                  );
                                });
                                // Function to be executed when Button 1 is pressed.
                              }),
                              _buildButton(3, '1:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    1,
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
                              _buildButton(4, '2:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    2,
                                    00,
                                  );
                                });
                                // Function to be executed when Button 1 is pressed.
                              }),
                              _buildButton(5, '2:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    2,
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
                              _buildButton(6, '3:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    3,
                                    00,
                                  );
                                });
                                // Function to be executed when Button 1 is pressed.
                              }),
                              _buildButton(7, '3:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
                                  controller.selectedDate.value = DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    3,
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
                              _buildButton(8, '4:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                              _buildButton(9, '4:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                              _buildButton(10, '5:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                              _buildButton(11, '5:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                              _buildButton(12, '6:00', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                              _buildButton(13, '6:30', () {
                                setState(() {
                                  // controller.isButtonTapped.value =
                                  //     !controller.isButtonTapped.value;
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
                          _buildButton(14, '7:00', () {
                            setState(() {
                              // controller.isButtonTapped.value =
                              //     !controller.isButtonTapped.value;
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
                        ],
                      ),
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
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff2282B7))),
                        onPressed: () {
                          controller.makeReservation(context);
                        },
                        child: Text('Confirm Booking'.tr)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Booking Page'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile Page'.tr,
          ),
        ],
        currentIndex: 1,
        selectedItemColor: AppConstants.appColor,
        onTap: _onItemTapped,
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

class ChangingTextWidget extends StatefulWidget {
  final List<String> textList;

  ChangingTextWidget(this.textList);

  @override
  _ChangingTextWidgetState createState() => _ChangingTextWidgetState();
}

class _ChangingTextWidgetState extends State<ChangingTextWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTextChanging();
  }

  void _startTextChanging() {
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.textList.length;
      });
      _startTextChanging();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.textList[currentIndex],
      style: TextStyle(fontSize: 24),
    );
  }
}
