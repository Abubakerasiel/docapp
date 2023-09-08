import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/user_detail_page.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/booking_controller.dart';
import '../controllers/home_controller.dart';
import 'booking_page2.0.dart';
import 'constanst.dart';
import 'user_page.dart';

class UserAppoimetn extends StatefulWidget {
  const UserAppoimetn({super.key});

  @override
  State<UserAppoimetn> createState() => _UserAppoimetnState();
}

class _UserAppoimetnState extends State<UserAppoimetn> {
  final ReservationController controller = Get.put(ReservationController());
  HomeController controller2 = Get.put(HomeController());

  @override
  void initState() {
    controller.fetchDates();
    //controller.getTodayAppointments();
    super.initState();
  }

  void _onItemTapped(int index) async {
    if (index == 0) {
      Get.off(() => UserPage(),
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          transition: Transition.native);
      // If 'Home' is tapped, do nothing (stay on the current page)
      return;
    } else if (index == 1) {
      // await controller.getDataFromFirestore();
      // If 'Business' is tapped, navigate to the sign-in screen
      Get.to(() => const BookingScreen(),
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          transition: Transition.native);
    } else if (index == 2) {
      Get.off(() => UserDetailsPage(userId: controller.user!.uid),
          arguments: controller.user!.uid,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          transition: Transition.native);
      // If 'School' is tapped, do nothing (stay on the current page)
      return;
    } else if (index == 3) {
      // Get.off(const UserAppoimetn());
      // If 'School' is tapped, do nothing (stay on the current page)
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers, unused_element
    void _onDeleteConfirmed(String dateId) async {
      setState(() {
        controller.deleteDate(dateId);
        controller.dates.removeWhere((date) => date.id == dateId);
      });
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _onReplaceConfirmed(String dateId) {
      setState(() {
        controller.deleteDateAndReplaceIt(dateId);
        controller.dates.removeWhere((date) => date.id == dateId);
      });
    }
    //  final currentUser = tl.FirebaseAuth.instance.currentUser;

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
          " ${controller.userName}",
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
                  onPressed: () => controller2.logOut(),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              'قواعد وشروط المكان ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
            const SizedBox(
              height: 10,
            ),
            const Text('الدخول بالميعاد وليس اولوية الحضور',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            const Text('الباكدج',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            const Text('٥٠٠ فى الشهر : مقسمة  مرة فى الاسبوع و صلاحية   ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey)),
            const SizedBox(
              height: 10,
            ),
            Text('  الباكدج لمدة شهر واسبوع و بعد ذلك تعتبر منتهية ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey)),
            const SizedBox(
              height: 10,
            ),
            Text('او بالمرة : ٢٠٠ جنية كل كشف او  متابعة',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey)),
            const SizedBox(
              height: 10,
            ),
            const Text('حجز المعاد من الابليكشن مفتوح قبل المعاد ب اسبوع',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            const Text(
                ' الاستفسار او الشكوى  برجاء ارسال رساله واتس اب على رقم ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(
              height: 4,
            ),
            Center(
              child: Text('01221246631',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: Obx(() {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: controller.dates.length,
                itemBuilder: (context, index) {
                  final date = controller.dates[index].data();

                  // Check for null values before extracting data
                  final timestamp = date['selectedDate'] as Timestamp?;

                  // final timestamp2 = date['selectedTime'];
                  final userName = date['userName'] as String?;
                  final userPhone = date['phone'] as String?;
                  final userID3 = date['userId'] as String?;

                  if (timestamp != null &&
                      userName != null &&
                      userPhone != null) {
                    final dateTime = timestamp.toDate();

                    String formattedTime = DateFormat.jm()
                        .format(dateTime.add(const Duration(hours: 1)));
                    String formattedDate =
                        DateFormat("EEE ,d MMM , ''yyyy").format(dateTime);

                    return Container(
                      decoration: BoxDecoration(
                        color: AppConstants.appColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await controller
                                          .retrieveUserData(userID3!);

                                      Get.to(
                                          () => UserDetailsPage(
                                                userId: userID3,
                                              ),
                                          arguments: userID3,
                                          curve: Curves.easeIn,
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition.native);
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              await controller
                                                  .retrieveUserData(userID3!);

                                              Get.to(
                                                  () => UserDetailsPage(
                                                        userId: userID3,
                                                      ),
                                                  arguments: userID3);
                                            },
                                            child: Text('Name'.tr,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.none,
                                                )),
                                          ),
                                          Text('$userName',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.none,
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Phone Number'.tr,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                decoration: TextDecoration.none,
                                              )),
                                          Text('  $userPhone',
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                decoration: TextDecoration.none,
                                              )),
                                        ],
                                      ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      decoration: TextDecoration.none,
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
                                        decoration: TextDecoration.none,
                                      ),
                                      ' ${formattedTime.toString().padLeft(2, '0')}'),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.redAccent),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: const BorderSide(
                                                    color: Colors.redAccent))),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _onReplaceConfirmed(
                                              controller.dates[index].id);
                                        });
                                      },
                                      child: Text('Cancel Date'.tr)),
                                ],
                              )
                            ]),
                      ),
                    );
                  } else {
                    return Container(); // Skip rendering if data is null
                  }
                },
              );
            })),
          ],
        ),
      ),
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
        currentIndex: 3,
        selectedItemColor: AppConstants.appColor,
        unselectedItemColor: Colors.grey.shade700,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
