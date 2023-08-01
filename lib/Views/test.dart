import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';

class BookingScreen5 extends StatefulWidget {
  @override
  State<BookingScreen5> createState() => _BookingScreen5State();
}

class _BookingScreen5State extends State<BookingScreen5> {
  final ReservationController controller = Get.put(ReservationController());
  List<bool> _isButtonTappedList = List.generate(14, (index) => false);
  DateTime today = DateTime.now();

  void _onDaySelectd(DateTime day, DateTime focusedDay) {
    if (day.weekday == DateTime.saturday) {
      setState(() {
        today = day;
        controller.selectedDate.value = today;
      });
    } else if (day.weekday == DateTime.sunday ||
        day.weekday == DateTime.monday ||
        day.weekday == DateTime.tuesday) {
      setState(() {
        today = day;
        controller.selectedDate.value = today;
      });
    } else {
      Get.snackbar(
        'Wrong Day',
        'Please Select A Day from Saturday To Tuesday',
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void initState() {
    controller.fetchDates();
    super.initState();
  }

  Widget _buildButton(int index, String buttonText, VoidCallback onTap) {
    bool isButtonDisabled = today.weekday == DateTime.saturday && index >= 12;
    int hour = 0;
    if (index % 2 == 0) {
      hour = 4 + (index ~/ 2);
    } else {
      hour = index ~/ 2;
    }

    return GestureDetector(
      onTap: () {
        if (!isButtonDisabled) {
          setState(() {
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
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 135,
        height: 35,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isButtonDisabled
              ? Color(0xFFCCCCCC)
              : _isButtonTappedList[index]
                  ? Color(0xFF2282B7)
                  : Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '${hour.toString().padLeft(2, '0')}:00',
          style: TextStyle(
            color: isButtonDisabled ? Colors.black54 : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ReservationController controller = Get.put(ReservationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
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
                          UserDetailsPage(userId: controller.user!.uid),
                          arguments: controller.user!.uid,
                        );
                      },
                      icon: Icon(
                        Icons.person,
                        size: 30,
                        color: AppConstants.appColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Booking Date:',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppConstants.appColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstants.appFont,
                  ),
                ),
                const SizedBox(height: 10),
                TableCalendar(
                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFF2282B7),
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(color: Colors.red),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.red),
                  ),
                  calendarBuilders: const CalendarBuilders(),
                  weekendDays: const [
                    DateTime.wednesday,
                    DateTime.thursday,
                    DateTime.friday,
                  ],
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  onDaySelected: _onDaySelectd,
                  availableGestures: AvailableGestures.all,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  rowHeight: 43,
                  focusedDay: today,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.utc(2030, 3, 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'Booking Time:',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppConstants.appColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstants.appFont,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(0, '00:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          0,
                          0,
                        );
                      });
                    }),
                    _buildButton(1, '02:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          2,
                          0,
                        );
                      });
                    }),
                    _buildButton(2, '04:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          4,
                          0,
                        );
                      });
                    }),
                    _buildButton(3, '06:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          6,
                          0,
                        );
                      });
                    }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(4, '08:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          8,
                          0,
                        );
                      });
                    }),
                    _buildButton(5, '10:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          10,
                          0,
                        );
                      });
                    }),
                    _buildButton(6, '12:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          12,
                          0,
                        );
                      });
                    }),
                    _buildButton(7, '14:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          14,
                          0,
                        );
                      });
                    }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(8, '16:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          16,
                          0,
                        );
                      });
                    }),
                    _buildButton(9, '18:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          18,
                          0,
                        );
                      });
                    }),
                    _buildButton(10, '19:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          19,
                          0,
                        );
                      });
                    }),
                    _buildButton(11, '20:00', () {
                      setState(() {
                        controller.isButtonTapped.value =
                            !controller.isButtonTapped.value;
                        controller.selectedDate.value = DateTime(
                          today.year,
                          today.month,
                          today.day,
                          20,
                          0,
                        );
                      });
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF2282B7)),
                      ),
                      onPressed: () {
                        controller.makeReservation(context);
                      },
                      child: const Text('Confirm Booking'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
