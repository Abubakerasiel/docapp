import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class TimeShowingTuesday extends StatefulWidget {
  const TimeShowingTuesday({super.key});

  @override
  State<TimeShowingTuesday> createState() => _TimeShowingTuesdayState();
}

class _TimeShowingTuesdayState extends State<TimeShowingTuesday> {
  final List<bool> _isButtonTappedList = List.generate(100, (index) => false);
  ReservationController controller = Get.put(ReservationController());
  @override
  Widget build(BuildContext context) {
    var today = controller.selectedDate.value;
    // bool isMondayOrTuesday = today.weekday == 1 || today.weekday == 2;

    DateTime? selectedDate = controller.selectedDate.value;
    // bool isSelectedDateMonday =
    //     selectedDate != null && (selectedDate.weekday == 1);
    // bool isSelectedDateSunday =
    //     selectedDate != null && (selectedDate.weekday == 7);

    bool isSelectedDateTuesday =
        selectedDate != null && (selectedDate.weekday == 2);

    return Column(
      children: [
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
                // print(controller.selectedDate.value);
              });
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
            _buildButton4(17, '8:15', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton4(18, '8:30', () {
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
                // print(controller.selectedDate.value);
              });
              // Function to be executed when Button 1 is pressed.
            })
          ],
        ),
        Obx(
          () => controller.isTuesday1H.value && isSelectedDateTuesday
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton4(19, '8:45', () {
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
                        _buildButton4(20, '9:00', () {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildButton4(21, '9:15', () {
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
                        _buildButton4(22, '9:30', () {
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
                    controller.isTuesday2H.value && isSelectedDateTuesday
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButton4(23, '9:45', () {
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
                                    });
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                  _buildButton4(24, '10:00', () {
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
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildButton4(25, '10:15', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today!.year,
                                        today.month,
                                        today.day,
                                        10,
                                        15,
                                      );
                                    });
                                    // Function to be executed when Button 1 is pressed.
                                  }),
                                  _buildButton4(26, '10:30', () {
                                    setState(() {
                                      // controller.isButtonTapped.value =
                                      //     !controller.isButtonTapped.value;
                                      controller.selectedDate.value = DateTime(
                                        today!.year,
                                        today.month,
                                        today.day,
                                        10,
                                        30,
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
