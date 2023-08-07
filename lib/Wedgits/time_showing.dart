import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/booking_controller.dart';

class TimeShowing extends StatefulWidget {
  TimeShowing({super.key});

  @override
  State<TimeShowing> createState() => _TimeShowingState();
}

class _TimeShowingState extends State<TimeShowing> {
  // DateTime today = DateTime.now();
  List<bool> _isButtonTappedList = List.generate(20, (index) => false);

  ReservationController controller = Get.put(ReservationController());
  @override
  Widget build(BuildContext context) {
    var today = controller.selectedDate.value;
    // bool isMondayOrTuesday = today.weekday == 1 || today.weekday == 2;

    DateTime? selectedDate = controller.selectedDate.value;
    bool isSelectedDateMonday =
        selectedDate != null && (selectedDate.weekday == 1);
    bool isSelectedDateSunday =
        selectedDate != null && (selectedDate.weekday == 7);

    bool isSelectedDateTuesday =
        selectedDate != null && (selectedDate.weekday == 2);

    //  bool  controller.selectedDate.value!.day = today.weekday == 1 || today.weekday == 2;
    // controller.selectedDate.value!.day;
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton4(0, '4:00', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                4,
                00,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
          _buildButton4(1, '4:30', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                4,
                30,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton4(2, '5:00', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                5,
                00,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
          _buildButton4(3, '5:30', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                5,
                30,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton4(4, '6:00', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                6,
                00,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
          _buildButton4(5, '6:30', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                6,
                30,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton4(6, '7:00', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                7,
                00,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
          _buildButton4(7, '7:30', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                7,
                30,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton4(8, '8:00', () {
            setState(() {
              // controller.isButtonTapped.value =
              //     !controller.isButtonTapped.value;
              controller.selectedDate.value = DateTime(
                today!.year,
                today.month,
                today.day,
                8,
                00,
              );
              print(controller.selectedDate.value);
            });
            // Function to be executed when Button 1 is pressed.
          }),
          controller.timeShowing2.value
              ? _buildButton4(9, '8:30', () {
                  setState(() {
                    // controller.isButtonTapped.value =
                    //     !controller.isButtonTapped.value;
                    controller.selectedDate.value = DateTime(
                      today!.year,
                      today.month,
                      today.day,
                      8,
                      30,
                    );
                    print(controller.selectedDate.value);
                  });
                  // Function to be executed when Button 1 is pressed.
                })
              : SizedBox(),
        ],
      ),
      Obx(
        () => controller.isMonday.value && isSelectedDateMonday
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton4(10, '9:00', () {
                    setState(() {
                      // controller.isButtonTapped.value =
                      //     !controller.isButtonTapped.value;
                      controller.selectedDate.value = DateTime(
                        today!.year,
                        today.month,
                        today.day,
                        9,
                        00,
                      );
                      var a = controller.selectedDate.value = DateTime(
                        today.year,
                        today.month,
                        today.day,
                        9,
                        00,
                      );
                      print(a);
                    });
                    // Function to be executed when Button 1 is pressed.
                  }),
                  _buildButton4(11, '9:30', () {
                    setState(() {
                      // controller.isButtonTapped.value =
                      //     !controller.isButtonTapped.value;
                      controller.selectedDate.value = DateTime(
                        today!.year,
                        today.month,
                        today.day,
                        9,
                        30,
                      );
                      var a = controller.selectedDate.value = DateTime(
                        today.year,
                        today.month,
                        today.day,
                        9,
                        00,
                      );
                      print(a);
                    });
                    // Function to be executed when Button 1 is pressed.
                  }),
                ],
              )
            : SizedBox(),
      ),
      Obx(
        () => controller.isTuesday.value && isSelectedDateTuesday
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton4(14, '9:00', () {
                    setState(() {
                      // controller.isButtonTapped.value =
                      //     !controller.isButtonTapped.value;
                      controller.selectedDate.value = DateTime(
                        today!.year,
                        today.month,
                        today.day,
                        9,
                        00,
                      );
                      var a = controller.selectedDate.value = DateTime(
                        today.year,
                        today.month,
                        today.day,
                        9,
                        00,
                      );
                      print(a);
                    });
                    // Function to be executed when Button 1 is pressed.
                  }),
                  _buildButton4(15, '9:30', () {
                    setState(() {
                      // controller.isButtonTapped.value =
                      //     !controller.isButtonTapped.value;
                      controller.selectedDate.value = DateTime(
                        today!.year,
                        today.month,
                        today.day,
                        9,
                        30,
                      );
                    });
                    // Function to be executed when Button 1 is pressed.
                  }),
                ],
              )
            : SizedBox(),
      ),
      Obx(
        () => controller.isSunday.value && isSelectedDateSunday
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton4(12, '8:30', () {
                    setState(() {
                      // controller.isButtonTapped.value =
                      //     !controller.isButtonTapped.value;
                      controller.selectedDate.value = DateTime(
                        today!.year,
                        today.month,
                        today.day,
                        8,
                        30,
                      );
                      var a = controller.selectedDate.value = DateTime(
                        today.year,
                        today.month,
                        today.day,
                        8,
                        30,
                      );
                      print(a);
                    });
                    // Function to be executed when Button 1 is pressed.
                  }),
                  _buildButton4(13, '9:00', () {
                    setState(() {
                      // controller.isButtonTapped.value =
                      //     !controller.isButtonTapped.value;
                      controller.selectedDate.value = DateTime(
                        today!.year,
                        today.month,
                        today.day,
                        9,
                        00,
                      );
                    });
                    var a = controller.selectedDate.value = DateTime(
                      today!.year,
                      today.month,
                      today.day,
                      9,
                      00,
                    );
                    print(a);
                    // Function to be executed when Button 1 is pressed.
                  }),
                ],
              )
            : SizedBox(),
      ),
    ]);
  }

  Widget _buildButton4(int index, String buttonText, VoidCallback onTap) {
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
