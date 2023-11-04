import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';
import 'user_detail_page.dart';

class DoctorCalender extends StatefulWidget {
  const DoctorCalender({super.key});

  @override
  State<DoctorCalender> createState() => _DoctorCalenderState();
}

class _DoctorCalenderState extends State<DoctorCalender> {
  ReservationController c = Get.put(ReservationController());
  DateTime today = DateTime.now();
  // ignore: unused_field
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        today = selectedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Date'.tr,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: AppConstants.appFont),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth > 500 ? 400 : double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
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
                      onDaySelected: _onDaySelected,
                      availableGestures: AvailableGestures.all,
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      rowHeight: 43,
                      //  locale: 'en_US',
                      focusedDay: today,
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2030, 3, 14)),
                  const SizedBox(height: 10),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('dates')
                          .where('selectedDate', isGreaterThanOrEqualTo: today)
                          .where('selectedDate',
                              isLessThanOrEqualTo: today.add(Duration(days: 1)))
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.data!.docs.length == 0) {
                          return Center(
                            child: Text(
                              'No Appointments For this Day'.tr,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          );
                        }
                        //    print(controller.selectedDate.value);

                        // var snap = snapshot.data!.docs[0].data() as Map;

                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: snapshot.data!.docs.length,
                              // reverse: true,
                              itemBuilder: (context, index) {
                                //   controller.fetchAllDates();
                                final date =
                                    snapshot.data!.docs[index].data() as Map;

                                // Check for null values before extracting data
                                final timestamp =
                                    date['selectedDate'] as Timestamp?;

                                // final timestamp2 = date['selectedTime'];
                                final userName = date['userName'] as String?;
                                final userPhone = date['phone'] as String?;
                                final userID3 = date['userId'] as String?;

                                if (timestamp != null &&
                                    userName != null &&
                                    userPhone != null) {
                                  final dateTime = timestamp.toDate();

                                  String formattedTime = DateFormat.jm().format(
                                      dateTime.add(const Duration(hours: 1)));
                                  String formattedDate =
                                      DateFormat("EEE ,d MMM , ''yyyy")
                                          .format(dateTime);

                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppConstants.appColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                Get.to(
                                                    () => UserDetailsPage(
                                                          userId: userID3!,
                                                        ),
                                                    arguments: userID3,
                                                    curve: Curves.easeInOut,
                                                    duration:
                                                        Duration(seconds: 1),
                                                    transition:
                                                        Transition.fadeIn);
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: Icon(Icons.person),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        Get.to(
                                                            () =>
                                                                UserDetailsPage(
                                                                  userId:
                                                                      userID3!,
                                                                ),
                                                            arguments: userID3,
                                                            curve: Curves
                                                                .easeInOut,
                                                            duration: Duration(
                                                                seconds: 1),
                                                            transition:
                                                                Transition
                                                                    .fadeIn);
                                                      },
                                                      child: Text(
                                                          'Name: $userName',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          )),
                                                    ),
                                                    Text(
                                                        'Phone Number: $userPhone',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 1,
                                              width: 300,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  size: 20,
                                                  Icons.calendar_month_outlined,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  " $formattedDate   ",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                const Icon(
                                                  size: 20,
                                                  Icons.access_time_outlined,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      decoration:
                                                          TextDecoration.none,
                                                    ),
                                                    ' ${formattedTime.toString().padLeft(2, '0')}'),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ]),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child:
                                        Text('No Appointments For this Day'.tr),
                                  ); // Skip rendering if data is null
                                }
                              },
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
