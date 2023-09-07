import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

// ignore: must_be_immutable
class TimeShowingThursday extends StatefulWidget {
  DateTime today;
  TimeShowingThursday({super.key, required this.today});

  @override
  State<TimeShowingThursday> createState() => _TimeShowingThursdayState();
}

class _TimeShowingThursdayState extends State<TimeShowingThursday> {
  final List<bool> _isButtonTappedList = List.generate(1000, (index) => false);
  ReservationController controller = Get.put(ReservationController());
  @override
  Widget build(BuildContext context) {
    var today = widget.today;
    bool isSelectedDateThrusday = (today.weekday == 4);

    return Obx(
      () => Column(children: [
        controller.Thrusday11.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(14, '11:00', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            11,
                            00,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(15, '11:15', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(16, '11:30', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            11,
                            30,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(17, '11:45', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            11,
                            45,
                          );
                        });
                      }),
                    ],
                  ),
                ],
              )
            : SizedBox(),
        controller.Thrusday12.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(18, '12:00', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            00,
                            00,
                          );
                        });
                      }),
                      _buildButton(19, '12:15', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(20, '12:30', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            00,
                            30,
                          );
                        });
                      }),
                      _buildButton(21, '12:45', () {
                        setState(() {
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday1.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(22, '1:00', () {
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
                      _buildButton(23, '1:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(24, '1:30', () {
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
                      _buildButton(25, '1:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday2.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(26, '2:00', () {
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
                      _buildButton(27, '2:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(28, '2:30', () {
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
                      _buildButton(29, '2:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday3.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(30, '3:00', () {
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
                      _buildButton(31, '3:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(32, '3:30', () {
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
                      _buildButton(33, '3:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday4.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(34, '4:00', () {
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
                      _buildButton(35, '4:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(36, '4:30', () {
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
                      _buildButton(37, '4:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday5.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(38, '5:00', () {
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
                      _buildButton(39, '5:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(40, '5:30', () {
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
                      _buildButton(41, '5:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday6.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(42, '6:00', () {
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
                      _buildButton(43, '6:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(44, '6:30', () {
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
                      _buildButton(45, '6:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday7.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(46, '7:00', () {
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
                      _buildButton(47, '7:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(48, '7:30', () {
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
                      _buildButton(49, '7:45', () {
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
                    ],
                  ),
                ],
              )
            : SizedBox(),
        controller.Thrusday8.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(50, '8:00', () {
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
                      _buildButton(51, '8:15', () {
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(52, '8:30', () {
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
                      _buildButton(53, '8:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday9.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(54, '9:00', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            9,
                            00,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(55, '9:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(56, '9:30', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            9,
                            30,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(57, '9:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday10.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(85, '10:00', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            10,
                            00,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(59, '10:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(60, '10:30', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            10,
                            30,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(61, '10:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday11am.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(621, '11:00', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            11,
                            00,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(63, '11:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(64, '11:30', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
                            today.year,
                            today.month,
                            today.day,
                            11,
                            30,
                          );
                        });
                        // Function to be executed when Button 1 is pressed.
                      }),
                      _buildButton(65, '11:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
        controller.Thrusday12am.value && isSelectedDateThrusday
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(66, '12:00', () {
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
                      _buildButton(67, '12:15', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButton(68, '12:30', () {
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
                      _buildButton(69, '12:45', () {
                        setState(() {
                          // controller.isButtonTapped.value =
                          //     !controller.isButtonTapped.value;
                          controller.selectedDate.value = DateTime(
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
          onTap();
        });

        // Execute the callback function when the button is tapped.
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
