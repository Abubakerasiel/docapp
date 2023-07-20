import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../Notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';
// import 'package:timezone/data/latest.dart' as tzl;
// import 'package:timezone/standalone.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

import 'package:get/get.dart';
import 'dart:math';
import 'dart:developer' as logi;

import 'home_controller.dart';

class ReservationController extends GetxController {
  final NotificationService notificationService = NotificationService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();

    notificationService.initNotification();
    retrieveUserData(user!.uid);
    // streamSubscription.listen((event) { })
  }

  RxString userName = RxString('');
  RxString userPhone = RxString('');
  RxString weight = RxString('');

  RxString age = RxString('');
  RxString height = RxString('');
  RxString gender = RxString('');
  int? package;

  final usersRef = FirebaseFirestore.instance.collection('users');

  final User? user = FirebaseAuth.instance.currentUser;

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dates = RxList([]);
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> fuser = RxList([]);

  String formatDateTime(DateTime date, String userName, String? userPhone) {
    final hour = date.hour + 1;
    final a = hour.toString();
    final formattedDate =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}   Time ${a.toString().padLeft(2, '0')}/${date.minute.toString().padLeft(2, '0')}';

    return ' Name: $userName       Date : $formattedDate   Phone:$userPhone ';
  }

  int generateRandomID(int length) {
    final random = Random();
    int id = 0;
    for (int i = 0; i < length; i++) {
      id += random.nextInt(10);
    }
    return id;
  }

  void checkDate(String documentId) {
    FirebaseFirestore.instance.collection('dates').doc(documentId).id.isEmpty;
  }

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  CollectionReference datesCollection =
      FirebaseFirestore.instance.collection('dates');

  Future<void> DatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
        selectableDayPredicate: (DateTime date) {
          // Check if the selected date is Sunday to Thursday
          return date.weekday == 1 ||
              date.weekday == 2 ||
              date.weekday == 3 ||
              date.weekday == 4 ||
              date.weekday == 7 ||
              date.weekday == 5 ||
              date.weekday == 6;
          // ... existing code ...
        });

    if (pickedDate != null) {
      if (pickedDate.weekday == 1 ||
          pickedDate.weekday == 2 ||
          pickedDate.weekday == 3 ||
          pickedDate.weekday == 4 ||
          pickedDate.weekday == 7 ||
          pickedDate.weekday == 5 ||
          pickedDate.weekday == 6) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: 12, minute: 0),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
        );

        if (pickedTime != null) {
          if (pickedTime.hour != null) {
            final DateTime selectedDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            // Schedule the notification
            //  await scheduleNotification(selectedDateTime);

            // Set the selected date and time
            selectedDate.value = selectedDateTime;
          } else {
            Get.snackbar(
              'Invalid Time',
              'Please select a time between 12 am to 9pm.',
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } else {
          Get.snackbar(
            'Invalid time',
            'Please select a date from Sunday to Thursday.',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          // Show
          //
          //an error snackbar for invalid time
          // ...
        }
      } else {
        Get.snackbar(
          'Invalid Day',
          'Please select a date from Sunday to Thursday.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  fetchDates() async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        final snapshot = await datesCollection
            .where('userEmail', isEqualTo: currentUser.email)
            .get();

        dates.value =
            snapshot.docs.cast<QueryDocumentSnapshot<Map<String, dynamic>>>();
      }
    } catch (error) {
      print("Failed to fetch dates: $error");
    }
  }

  void fetchAllDates() async {
    try {
      final snapshot = await datesCollection.get();
      dates.value =
          snapshot.docs.cast<QueryDocumentSnapshot<Map<String, dynamic>>>();
    } catch (error) {
      print("Failed to fetch dates: $error");
    }
  }

  void saveTextToFirebase(String text) {
    FirebaseFirestore.instance
        .collection('userText')
        .add({'text': text})
        .then((value) => print('Text saved to Firebase'))
        .catchError((error) => print('Failed to save text: $error'));
  }

  Future<Map<String, dynamic>?> retrieveUserData(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      if (snapshot.exists) {
        userName.value = snapshot.data()?['name'];
        userPhone.value = snapshot.data()?['phone'];
        weight.value = snapshot.data()?['weight'];
        age.value = snapshot.data()?['age'];
        height.value = snapshot.data()?['height'];
        gender.value = snapshot.data()?['gender'];
        package = snapshot.data()?['package'];
        return snapshot.data();
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error retrieving user data: $e');
      return null;
    }
  }

  void deleteDate(String documentId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await datesCollection.doc(documentId).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      final Map<String, dynamic> appointmentData =
          documentSnapshot.data() ?? {};

      if (appointmentData.isNotEmpty) {
        // Delete the appointment
        await datesCollection.doc(documentId).delete();

        // Check if there are users on the waiting list
        final QuerySnapshot<Map<String, dynamic>> waitingListSnapshot =
            await datesCollection
                .where('selectedDate',
                    isEqualTo: appointmentData['selectedDate'])
                .orderBy('selectedDate')
                .limit(1)
                .get() as QuerySnapshot<Map<String, dynamic>>;

        if (waitingListSnapshot.size > 0) {
          final DocumentSnapshot<Map<String, dynamic>> waitingListDoc =
              waitingListSnapshot.docs.first;
          final String waitingListDocId = waitingListDoc.id;

          // Retrieve the waiting list data
          final Map<String, dynamic> waitingListData =
              waitingListDoc.data() as Map<String, dynamic>;

          final String waitingListUserId = waitingListData['userId'];
          final String waitingListUserEmail = waitingListData['userEmail'];
          final String waitingListUserName = waitingListData['userName'];
          final String waitingListUserPhone = waitingListData['phone'];
          final DateTime waitingListNotificationTime =
              waitingListData['Notification Time'];

          // Delete the waiting list entry
          await datesCollection.doc(waitingListDocId).delete();

          // Assign the waiting list user to the freed appointment slot
          final Map<String, dynamic> waitingListReservationData = {
            'selectedDate': appointmentData['selectedDate'],
            'userId': waitingListUserId,
            'userEmail': waitingListUserEmail,
            'phone': waitingListUserPhone,
            'userName': waitingListUserName,
            'Notification Time': waitingListNotificationTime,
          };

          final DocumentReference waitingListReservationDoc =
              await datesCollection.add(waitingListReservationData);
          print(
              "Waiting list user assigned to the freed appointment slot. Document ID: ${waitingListReservationDoc.id}");

          // Send a notification to the waiting list user
          await notificationService.showNotification(
            id: generateRandomID(8),
            notificationTime: waitingListNotificationTime,
            title: 'Reservation Update',
            body:
                'Hello ${waitingListUserName}! You have been assigned an appointment slot.',
            data: null,
          );
        }
      }
    } catch (error) {
      print('Failed to delete or replace appointment: $error');
    }
  }

  void makeReservation(BuildContext context) async {
    DateTime getStartOfDay(DateTime date) {
      return DateTime(date.year, date.month, date.day, 0, 0, 0);
    }

    DateTime getEndOfDay(DateTime date) {
      return DateTime(date.year, date.month, date.day, 23, 59, 59);
    }

    int randomID = generateRandomID(8);

    final DateTime notificationTime =
        selectedDate.value!.subtract(Duration(hours: 24));
    final DateTime notificationTimeSameDay =
        selectedDate.value!.subtract(Duration(hours: 3));

    selectedDate.value = selectedDate.value!.add(Duration(hours: -1));

    final notificationTitle = 'Reservation Reminder';
    final notificationBody =
        'Hello ${userName.value}! Your appointment is coming up in 24 hours.';
    final notificationBody2 =
        'Hello ${userName.value}! Your appointment is coming up in 3 hours.';

    // Check if the maximum number of appointments for the day (30) has been reached
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final String selectedDateString = dateFormatter.format(selectedDate.value!);
    final int maxAppointmentsPerDay = 4;
    final QuerySnapshot<Map<String, dynamic>> existingAppointmentsSnapshot =
        await datesCollection
            .where('selectedDate', isEqualTo: selectedDate.value)
            .get() as QuerySnapshot<Map<String, dynamic>>;
    final int existingAppointmentsCount = existingAppointmentsSnapshot.size;

    if (existingAppointmentsCount > 0) {
      Get.snackbar(
        'Appointment Not Available',
        'The selected date and time are already booked.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    // Check if the user has already booked an appointment on the selected date
    // Check if the user has already booked an appointment on the selected date
    final QuerySnapshot<Map<String, dynamic>> userAppointmentsSnapshot =
        await datesCollection.where('userId', isEqualTo: user!.uid).get()
            as QuerySnapshot<Map<String, dynamic>>;

    final selectedDateStart = getStartOfDay(DateTime.parse(selectedDateString));
    final selectedDateEnd = getEndOfDay(DateTime.parse(selectedDateString));

    bool userAlreadyBookedForDay = false;
    for (final doc in userAppointmentsSnapshot.docs) {
      final appointmentDate = doc['selectedDate'].toDate() as DateTime;
      if (appointmentDate.isAfter(selectedDateStart) &&
          appointmentDate.isBefore(selectedDateEnd)) {
        userAlreadyBookedForDay = true;
        break;
      }
    }

    if (userAlreadyBookedForDay) {
      Get.snackbar(
        'Multiple Bookings Not Allowed',
        'You have already booked an appointment on the selected date.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (existingAppointmentsCount >= maxAppointmentsPerDay) {
      // Maximum appointments reached for the day
      final QuerySnapshot<Map<String, dynamic>> waitingListSnapshot =
          await waitingListCollection
              .where('userId', isEqualTo: user!.uid)
              .get() as QuerySnapshot<Map<String, dynamic>>;

      if (waitingListSnapshot.size == 0) {
        // Add the user to the waiting list
        final waitingListData = {
          'userId': user!.uid,
          'userEmail': user!.email,
          'phone': userPhone.value,
          'userName': userName.value,
          'Notification Time': notificationTimeSameDay.add(Duration(hours: -1)),
        };

        await waitingListCollection.add(waitingListData);

        Get.snackbar(
          'Waiting List',
          'Sorry, no available appointments. You have been added to the waiting list.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.yellow,
          colorText: Colors.black,
        );

        // Send a notification to inform the user about being added to the waiting list
        await notificationService.showNotification(
          id: generateRandomID(8),
          notificationTime: notificationTimeSameDay,
          title: 'Waiting List',
          body:
              'Hello ${userName.value}! You have been added to the waiting list.',
          data: null,
        );
      } else {
        Get.snackbar(
          'Waiting List',
          'Sorry, no available appointments. You are already on the waiting list.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.yellow,
          colorText: Colors.black,
        );
      }
    } else {
      if (selectedDate.value != null) {
        if (selectedDate.value!.isBefore(DateTime.now())) {
          Get.snackbar(
            'Invalid Date',
            'Please select a future date and time.',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
          return;
        }

        if (selectedDate.value!.weekday == DateTime.saturday ||
            selectedDate.value!.weekday == DateTime.sunday) {
          Get.snackbar(
            'Invalid Day',
            'Please select a date from Monday to Friday.',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
          return;
        }

        final reservationData = {
          'selectedDate': selectedDate.value,
          'userId': user!.uid,
          'userEmail': user!.email,
          'phone': userPhone.value,
          'userName': userName.value,
          'Notification Time': notificationTimeSameDay.add(Duration(hours: -1)),
          // Add more relevant data as needed
        };

        final dateDoc = await datesCollection.add(reservationData);
        print("Date saved successfully! Document ID: ${dateDoc.id}");

        Map<String, dynamic>? notificationData = {
          // Include any additional data you want to pass with the notification
        };

        // Schedule notification 3 hours before the appointment
        await notificationService.showNotification(
          id: randomID,
          notificationTime: notificationTimeSameDay,
          title: notificationTitle,
          body: notificationBody2,
          data: notificationData,
        );

        Get.snackbar(
          'Successful booking',
          'You have successfully booked your appointment',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.greenAccent,
          colorText: Colors.white,
        );

        // Check if there are users on the waiting list
        final QuerySnapshot<Map<String, dynamic>> waitingListSnapshot =
            await waitingListCollection
                .orderBy('Notification Time')
                .limit(1)
                .get() as QuerySnapshot<Map<String, dynamic>>;

        if (waitingListSnapshot.size > 0) {
          final waitingListDoc = waitingListSnapshot.docs.first;
          final waitingListDocId = waitingListDoc.id;

          // Retrieve the waiting list data
          final waitingListData = waitingListDoc.data();
          final waitingListUserId = waitingListData['userId'];
          final waitingListUserEmail = waitingListData['userEmail'];
          final waitingListUserName = waitingListData['userName'];
          final waitingListUserPhone = waitingListData['phone'];
          final waitingListNotificationTime =
              waitingListData['Notification Time'];

          // Delete the waiting list entry
          await waitingListCollection.doc(waitingListDocId).delete();

          // Assign the waiting list user to the freed appointment slot
          final waitingListReservationData = {
            'selectedDate': selectedDate.value,
            'userId': waitingListUserId,
            'userEmail': waitingListUserEmail,
            'phone': waitingListUserPhone,
            'userName': waitingListUserName,
            'Notification Time': waitingListNotificationTime,
          };

          final waitingListReservationDoc =
              await datesCollection.add(waitingListReservationData);
          print(
              "Waiting list user assigned to the freed appointment slot. Document ID: ${waitingListReservationDoc.id}");

          // Send a notification to the waiting list user
          await notificationService.showNotification(
            id: generateRandomID(8),
            notificationTime: waitingListNotificationTime,
            title: notificationTitle,
            body: notificationBody,
            data: notificationData,
          );
        }
      } else {
        Get.dialog(
          AlertDialog(
            title: Text('Error'),
            content: Text('Please select a date and time.'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}