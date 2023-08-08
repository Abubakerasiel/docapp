import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';
import 'user_detail_page.dart';
import 'package:intl/intl.dart';

class BookingConfirmed extends StatelessWidget {
  const BookingConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    Rx<DateTime?> data = Get.arguments;
    var time1 = data.value!.add(const Duration(hours: 1)).toString();

    DateTime dateTime = DateTime.parse(time1);

    String formattedDate = DateFormat("'on' d MMMM yyyy").format(dateTime);
    String formattedTime = DateFormat("hh:mm ").format(dateTime);

    // String formattedTime = DateFormat("hh:mm").format(dateTime);
    formattedTime += dateTime.hour > 12 ? " AM" : " PM";

    ReservationController controller = Get.put(ReservationController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const CircleAvatar(
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
              height: 100,
            ),
            Text(
              'Congratulation',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppConstants.appColor),
            ),
            const SizedBox(
              height: 29,
            ),
            const Text(
              'Your booking has been confirmed ',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 29,
            ),
            Text(
              '$formattedDate $formattedTime',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 29,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  'Location :\n aklknwldkansdklabsdlka\nsnd,samdn, Cairo, Egypt',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            GestureDetector(
              onTap: () {
                MapsLauncher.launchQuery(
                    'Villa No. 48, 2nd Floor, Flat 6, 105th Street, El Horreya Sq, Maadi, Cairo Governorate 11728');
              },
              child: Container(
                height: 204,
                width: 356,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/software-design.png"),
                      fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
