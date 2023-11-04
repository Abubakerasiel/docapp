import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../controllers/booking_controller.dart';
import 'constanst.dart';
import 'user_detail_page.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BookingConfirmed extends StatefulWidget {
  DateTime Date;
  BookingConfirmed({super.key, required this.Date});

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  @override
  Widget build(BuildContext context) {
    DateTime time1 = widget.Date.add(const Duration(hours: 1));

    // DateTime dateTime = DateTime.parse(time1);

    String formattedDate = DateFormat("'on' d MMMM yyyy")
        .format(time1.hour == 23 ? time1.add(Duration(days: 1)) : time1);

    String formattedTime = DateFormat("hh:mm ").format(time1);

    // String formattedTime = DateFormat("hh:mm").format(dateTime);
    formattedTime += time1.hour > 12 ? " AM" : " PM";

    ReservationController controller = Get.put(ReservationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      backgroundColor: Colors.lightBlue,
                      radius: 15,
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
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
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                'Congratulation'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: AppConstants.appColor),
              ),
              const SizedBox(
                height: 29,
              ),
              Text(
                'Your booking has been confirmed '.tr,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
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
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Location:'.tr,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ),
                subtitle: Text(
                  textAlign: TextAlign.center,
                  ' شارع ٢١٠ميدان فيكتوريا دجله المعادى عمارة كيمو ماركت سابقا (جروسر حاليا )  الدور ٣ سنتر جمالى',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              GestureDetector(
                onTap: () {
                  MapsLauncher.launchCoordinates(29.9589590, 31.2709000);
                },
                child: Container(
                  height: 204,
                  width: 356,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/2.jpg"), fit: BoxFit.cover),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
