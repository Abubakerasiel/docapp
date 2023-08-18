import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class TimeShowingSunday extends StatefulWidget {
  const TimeShowingSunday({super.key});

  @override
  State<TimeShowingSunday> createState() => _TimeShowingSundayState();
}

class _TimeShowingSundayState extends State<TimeShowingSunday> {
  final List<bool> _isButtonTappedList = List.generate(100, (index) => false);
  ReservationController controller = Get.put(ReservationController());
  @override
  Widget build(BuildContext context) {
    var today = controller.selectedDate.value;
    // bool isMondayOrTuesday = today.weekday == 1 || today.weekday == 2;

    DateTime? selectedDate = controller.selectedDate.value;
    // bool isSelectedDateMonday =
    //     selectedDate != null && (selectedDate.weekday == 1);
    bool isSelectedDateSunday =
        selectedDate != null && (selectedDate.weekday == 7);

    // bool isSelectedDateTuesday =
    //     selectedDate != null && (selectedDate.weekday == 2);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(0, '4:00', () {
              print('hhh');
              if (controller.selectedDate.value != null) {
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
                  // print(controller.selectedDate.value);
                });
              }

              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(1, '4:15', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  4,
                  15,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(2, '4:30', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(3, '4:45', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  4,
                  45,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(4, '5:00', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(5, '5:15', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  5,
                  15,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(6, '5:30', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(7, '5:45', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  5,
                  45,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(8, '6:00', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(9, '6:15', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  6,
                  15,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(10, '6:30', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(11, '6:45', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  6,
                  45,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(12, '7:00', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(13, '7:15', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  7,
                  15,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(14, '7:30', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
            _buildButton4(15, '7:45', () {
              setState(() {
                // controller.isButtonTapped.value =
                //     !controller.isButtonTapped.value;
                controller.selectedDate.value = DateTime(
                  today!.year,
                  today.month,
                  today.day,
                  7,
                  45,
                );
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton4(16, '8:00', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Obx(
          () => controller.isSunday1H.value && isSelectedDateSunday
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton4(35, '8:15', () {
                          setState(() {
                            // controller.isButtonTapped.value =
                            //     !controller.isButtonTapped.value;
                            controller.selectedDate.value = DateTime(
                              today!.year,
                              today.month,
                              today.day,
                              8,
                              15,
                            );
                          });
                          // Function to be executed when Button 1 is pressed.
                        }),
                        _buildButton4(36, '8:30', () {
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
                          });

                          // Function to be executed when Button 1 is pressed.
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton4(37, '8:45', () {
                          setState(() {
                            // controller.isButtonTapped.value =
                            //     !controller.isButtonTapped.value;
                            controller.selectedDate.value = DateTime(
                              today!.year,
                              today.month,
                              today.day,
                              8,
                              45,
                            );
                          });
                          // Function to be executed when Button 1 is pressed.
                        }),
                        _buildButton4(38, '9:00', () {
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

                          // Function to be executed when Button 1 is pressed.
                        }),
                      ],
                    ),
                    controller.isSunday2H.value && isSelectedDateSunday
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButton4(39, '9:15', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today!.year,
                                        today.month,
                                        today.day,
                                        9,
                                        15,
                                      );
                                    });
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                  _buildButton4(40, '9:30', () {
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
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButton4(41, '9:45', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today!.year,
                                        today.month,
                                        today.day,
                                        9,
                                        45,
                                      );
                                      // var a = controller.selectedDate.value =
                                      //     DateTime(
                                      //   today.year,
                                      //   today.month,
                                      //   today.day,
                                      //   8,
                                      //   30,
                                      // );
                                      // print(a);
                                    });
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                  _buildButton4(42, '10:00', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today!.year,
                                        today.month,
                                        today.day,
                                        10,
                                        00,
                                      );
                                    });
                                    // var a =
                                    //     controller.selectedDate.value = DateTime(
                                    //   today!.year,
                                    //   today.month,
                                    //   today.day,
                                    //   9,
                                    //   00,
                                    // );
                                    // print(a);
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
      ],
    );
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
