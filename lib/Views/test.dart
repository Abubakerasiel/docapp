//import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutterappoinmentapp/Views/user_appoiment.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:flutterappoinmentapp/Views/user_page.dart';

import 'package:flutterappoinmentapp/Wedgits/time_showing3.dart';
import 'package:flutterappoinmentapp/Wedgits/time_showing4.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';

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
  int selectedTimeIndex = -1;

  final ReservationController controller = Get.put(ReservationController());
  final List<bool> _isButtonTappedList = List.generate(200, (index) => false);
  // int _selectedIndex = -1;
  DateTime today = DateTime.now().add(const Duration(days: 7));
  void _onDaySelectd(DateTime day, DateTime focusedDay) {
    void call() async {
      await controller.getDataFromFirestore();
    }

    call();
    setState(() {
      selectedTimeIndex = -1; // Reset the selected time index
    });

    // Set this variable based on your condition

    if (day.weekday == 3 || day.weekday == 4 || day.weekday == 5) {
      Get.snackbar(
        'Wrong Day'.tr,
        'Please Select A Day from Saturday To Tuesday'.tr,
        backgroundColor: Colors.red,
      );
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
      });
    } else {
      Get.snackbar(
        'The Day is off'.tr,
        'Please Select Another day'.tr,
        backgroundColor: Colors.red,
      );
      // setState(() {
      //   today = day;
      //   controller.selectedDate.value = today;
      //   controller.timeShowing.value = true;
      // });
    }
  }

  int currentIndex = 0;
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
    controller.fetchDates();
    super.initState();
    controller.getDataFromFirestore();
    // controller.isMonday;
    // controller.isSaturday;
    // controller.isSunday;
    // controller.isTuesday;

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

    DateTime? selectedDate = controller.selectedDate.value;
    bool isSelectedDateSat =
        selectedDate != null && (selectedDate.weekday == 6);
    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) {
      if (index == 0) {
        Get.off(const UserPage(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'Home' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 1) {
        // If 'Business' is tapped, navigate to the sign-in screen
        // Get.off(BookingScreen());
      } else if (index == 2) {
        Get.off(UserDetailsPage(userId: controller.user!.uid),
            arguments: controller.user!.uid,
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
        // If 'School' is tapped, do nothing (stay on the current page)
        return;
      } else if (index == 3) {
        Get.off(const UserAppoimetn(),
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            transition: Transition.fadeIn);
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
          "Hello ${controller.userName}",
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
                  onPressed: Get.find<HomeController>().logOut,
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
      // appBar: AppBar(
      //   title: Text('${today.toString().split('')[0]}'),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: Obx(
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
                            color: Colors.lightBlue, shape: BoxShape.circle),
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
                      firstDay: DateTime.now().add(const Duration(days: 7)),
                      lastDay: DateTime.utc(2030, 3, 14)),
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
                      ? const TimeShowingSunday()
                      : controller.mondayTimeShowing.value
                          ? const TimeShowingMonday()
                          : controller.tuesTimeShowing.value
                              ? const TimeShowingTuesday()
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildButton(14, '12:00', () {
                                          setState(() {
                                            // controller.isButtonTapped.value =
                                            //     !controller.isButtonTapped.value;
                                            controller.selectedDate.value =
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
                                        _buildButton(15, '12:15', () {
                                          setState(() {
                                            // controller.isButtonTapped.value =
                                            //     !controller.isButtonTapped.value;
                                            controller.selectedDate.value =
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
                                    _buildButton(44, '7:30', () {
                                      setState(() {
                                        // controller.isButtonTapped.value =
                                        //     !controller.isButtonTapped.value;
                                        controller.selectedDate.value =
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
                                  ],
                                ),
                  Obx(
                    () => controller.isSaturday1H.value && isSelectedDateSat
                        //  controller.satL.value
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButton(45, '7:45', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today.year,
                                        today.month,
                                        today.day,
                                        7,
                                        45,
                                      );
                                    });
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                  _buildButton(46, '8:00', () {
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
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButton(47, '8:15', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today.year,
                                        today.month,
                                        today.day,
                                        8,
                                        15,
                                      );
                                    });
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                  _buildButton(48, '8:30', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
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
                              controller.isSaturday2H.value && isSelectedDateSat
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            _buildButton(49, '8:45', () {
                                              setState(() {
                                                // controller.isButtonTapped.value =
                                                //     !controller.isButtonTapped.value;
                                                controller.selectedDate.value =
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
                                            _buildButton(50, '9:00', () {
                                              setState(() {
                                                // controller.isButtonTapped.value =
                                                //     !controller.isButtonTapped.value;
                                                controller.selectedDate.value =
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
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox()
                            ],
                          )
                        : const SizedBox(),
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
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.lightBlue)),
                          onPressed: () {
                            if (controller.selectedDate.value != null) {
                              controller.makeReservation();
                            } else {
                              Get.snackbar(
                                  'Wrong Date'.tr, 'Please Select A Date'.tr,
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
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Get.to(const UserAppoimetn());
      // }),
      bottomNavigationBar: BottomNavigationBar(
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
    //  bool isButtonDisabled = selectedTimeIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTimeIndex = index;
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
