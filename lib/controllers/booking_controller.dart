import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../Notification_service.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
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
    sendNotificatonToUser(user!.uid);

    // streamSubscription.listen((event) { })
  }

  // @override
  // void onClose() {
  //   // Dispose of the controller properly
  //   super.onClose();
  //   // flutterLocalNotificationsPlugin.dispose();
  // }

  RxString userName = RxString('');
  RxString userPhone = RxString('');
  RxString weight = RxString('');

  RxString age = RxString('');
  RxString height = RxString('');
  RxString gender = RxString('');
  int? package;
  RxBool y = false.obs;

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
              date.weekday == 7 ||
              date.weekday == 6;
          // ... existing code ...
        });

    if (pickedDate != null) {
      if (pickedDate.weekday == 1 ||
          pickedDate.weekday == 2 ||
          pickedDate.weekday == 7 ||
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
          if (pickedTime.hour < 21) {
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

  Future<List<Map<String, dynamic>>> getTodayAppointments() async {
    final DateTime now = DateTime.now();
    final DateTime startOfToday =
        DateTime(now.year, now.month, now.day, 0, 0, 0);
    final DateTime endOfToday =
        DateTime(now.year, now.month, now.day, 23, 59, 59);

    final QuerySnapshot<Map<String, dynamic>> todayAppointmentsSnapshot =
        await datesCollection
            .where('selectedDate', isGreaterThanOrEqualTo: startOfToday)
            .where('selectedDate', isLessThanOrEqualTo: endOfToday)
            .get() as QuerySnapshot<Map<String, dynamic>>;
    dates.value = todayAppointmentsSnapshot.docs
        .cast<QueryDocumentSnapshot<Map<String, dynamic>>>();

    final List<Map<String, dynamic>> todayAppointments =
        todayAppointmentsSnapshot.docs.map((doc) => doc.data()).toList();
    return todayAppointments;
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

  void sendNotificatonToUser(String userID1) async {
    var package2;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID1).get();
    if (snapshot.exists) {
      package2 = snapshot.data()?['package'];
      //   return snapshot.data();
    }

    if (package2 <= 3) {
      await notificationService.showNotification(
        id: generateRandomID(8),
        notificationTime: DateTime.now().add(Duration(minutes: 1)),
        title: 'Package Reminder Update',
        body: 'Hello You have to pay the money.',
        data: null,
      );
    }
  }

  void Paidpackge(String userID1) async {
    var package2;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID1).get();
    if (snapshot.exists) {
      package2 = snapshot.data()?['package'];
      package2 += 10;

      //   return snapshot.data();
    }
    // if (package2 > 5) {
    //   y.value = true;
    // }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID1)
        .update({'package': package2});
  }

  void paymentStatus(String userID1) async {
    late var package3;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID1).get();
    if (snapshot.exists) {
      package3 = snapshot.data()?['package'];
      if (package3 > 5) {
        y.value = true;
      }

      //   return snapshot.data();
    }
  }

  void saveTextToFirebase(String text) async {
    FirebaseFirestore.instance
        .collection('userText')
        .add({'text': text})
        .then((value) => print('Text saved to Firebase'))
        .catchError((error) => print('Failed to save text: $error'));
    //    Send a notification at the moment of replacement
    await notificationService.showNotification(
      id: generateRandomID(8),
      notificationTime: DateTime.now().add(Duration(minutes: 1)),
      title: 'Annoucement Update',
      body: 'An Annoucemnet has been made please sigin to see it ',
      data: null,
    );
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
    var UserIdInDateColletion;

    await FirebaseFirestore.instance
        .collection('dates')
        .doc(documentId)
        .get() // Get the document data
        .then((docSnapshot) {
      if (docSnapshot.exists) {
        String userId = docSnapshot.data()!['userId'];
        UserIdInDateColletion = userId;
        // Access the user ID field
        // Now you have the user ID and can use it for any further operations if needed
        print('User ID: $userId');
        print(UserIdInDateColletion);
      } else {
        print('Document not found.');
      }
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error) => logi.log('Error getting document: $error'));

    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(UserIdInDateColletion)
            .get();
    if (snapshot.exists) {
      package = snapshot.data()?['package'];
      //   return snapshot.data();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(UserIdInDateColletion)
        .update({'package': package! - 1});

    FirebaseFirestore.instance
        .collection('dates')
        .doc(documentId)
        .delete()
        .then((value) => print('Date deleted'))
        .catchError((error) => print('Failed to delete date: $error'));
  }

  void deleteDateAndRpalceIt(String documentId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await datesCollection.doc(documentId).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      final Map<String, dynamic> appointmentData =
          documentSnapshot.data() ?? {};

      if (appointmentData.isNotEmpty) {
        // Get the selectedDate of the appointment to be deleted (ignoring the time)
        DateTime deletedDate = DateTime(
          appointmentData['selectedDate'].toDate().year,
          appointmentData['selectedDate'].toDate().month,
          appointmentData['selectedDate'].toDate().day,
        );

        // Delete the appointment
        await datesCollection.doc(documentId).delete();

        // Check if there are users on the waiting list and order them by insertion timestamp
        final QuerySnapshot<Map<String, dynamic>> waitingListSnapshot =
            await waitingListCollection
                .orderBy('insertionTimestamp') // Order by insertion timestamp
                .limit(5)
                .get() as QuerySnapshot<Map<String, dynamic>>;

        final List<QueryDocumentSnapshot<Map<String, dynamic>>>
            waitingListDocs = waitingListSnapshot.docs;

        QueryDocumentSnapshot<Map<String, dynamic>>? waitingListDoc;

        if (waitingListDocs.isNotEmpty) {
          // Find the first waiting list entry with the same date as the deleted appointment
          for (var doc in waitingListDocs) {
            final DateTime waitingListSelectedDate = DateTime(
              doc.data()['selectedDate'].toDate().year,
              doc.data()['selectedDate'].toDate().month,
              doc.data()['selectedDate'].toDate().day,
            );

            if (deletedDate.isAtSameMomentAs(waitingListSelectedDate)) {
              waitingListDoc = doc;
              break;
            }
          }

          if (waitingListDoc != null) {
            final String waitingListDocId = waitingListDoc.id;

            // Retrieve the waiting list data
            final Map<String, dynamic> waitingListData =
                waitingListDoc.data() as Map<String, dynamic>;

            // Delete the waiting list entry
            await waitingListCollection.doc(waitingListDocId).delete();

            // Assign the waiting list user to the freed appointment slot
            final Map<String, dynamic> waitingListReservationData = {
              'selectedDate': appointmentData[
                  'selectedDate'], // Use the original date with time
              'userId': waitingListData['userId'],
              'userEmail': waitingListData['userEmail'],
              'phone': waitingListData['phone'],
              'userName': waitingListData['userName'],
              'Notification Time': waitingListData['Notification Time'],
            };

            // Replace the appointment with the waiting list entry
            await datesCollection.add(waitingListReservationData);
            print("Waiting list user assigned to the freed appointment slot.");

            //    Send a notification at the moment of replacement
            await notificationService.showNotification(
              id: generateRandomID(8),
              notificationTime: DateTime.now().add(Duration(minutes: 4)),
              title: 'Reservation Update',
              body:
                  'Hello ${waitingListData['userName']}! You have been assigned an appointment slot.',
              data: null,
            );

            // Send a notification 24 hours before the appointment if it's in the future
            final DateTime now = DateTime.now();
            final DateTime appointmentDateTime = deletedDate;

            if (appointmentDateTime.isAfter(now)) {
              final DateTime notificationDateTime =
                  appointmentDateTime.subtract(Duration(hours: 24));

              await notificationService.showNotification(
                id: generateRandomID(8),
                notificationTime: notificationDateTime,
                title: 'Upcoming Appointment',
                body:
                    'Hello ${waitingListData['userName']}! Your appointment is scheduled for tomorrow.',
                data: null,
              );
            } else {
              // Send a notification 3 hours before the appointment if it's on the same day
              final DateTime notificationDateTime =
                  appointmentDateTime.subtract(Duration(hours: 3));

              await notificationService.showNotification(
                id: generateRandomID(8),
                notificationTime: notificationDateTime,
                title: 'Upcoming Appointment',
                body:
                    'Hello ${waitingListData['userName']}! Your appointment is scheduled for today.',
                data: null,
              );
            }
          }
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
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final String selectedDateString = dateFormatter.format(selectedDate.value!);
    final int maxAppointmentsPerDay = 2;
    final selectedDateStart = getStartOfDay(DateTime.parse(selectedDateString));
    final selectedDateEnd = getEndOfDay(DateTime.parse(selectedDateString));

    // Check if the maximum number of appointments for the day (4) has been reached
    final QuerySnapshot<Map<String, dynamic>> existingAppointmentsSnapshot =
        await datesCollection
            .where('selectedDate',
                isGreaterThan: selectedDateStart, isLessThan: selectedDateEnd)
            .get() as QuerySnapshot<Map<String, dynamic>>;
    final int existingAppointmentsCount = existingAppointmentsSnapshot.size;

    // Check if the selected time slot is already booked
    final QuerySnapshot<Map<String, dynamic>> selectedTimeAppointmentsSnapshot =
        await datesCollection
            .where('selectedDate', isEqualTo: selectedDate.value)
            .get() as QuerySnapshot<Map<String, dynamic>>;
    final int selectedTimeAppointmentsCount =
        selectedTimeAppointmentsSnapshot.size;

    // Check if the user is already in the waiting list for the selected date
    final QuerySnapshot<
        Map<String,
            dynamic>> userWaitingListSnapshot = await waitingListCollection
        // .where('selectedDate',
        //     isGreaterThan: selectedDateStart, isLessThan: selectedDateEnd)
        .where('userId', isEqualTo: user!.uid)
        .get() as QuerySnapshot<Map<String, dynamic>>;
    final int userWaitingListCount = userWaitingListSnapshot.size;
    // Check if the waiting list size is less than five
    final QuerySnapshot<Map<String, dynamic>> waitingListSnapshot =
        await waitingListCollection
            .where('selectedDate',
                isGreaterThan: selectedDateStart, isLessThan: selectedDateEnd)
            .get() as QuerySnapshot<Map<String, dynamic>>;
    final int waitingListCount = waitingListSnapshot.size;

    if (existingAppointmentsCount >= maxAppointmentsPerDay) {
      if (userWaitingListCount == 0) {
        if (waitingListCount < 2) {
          // Add the user to the waiting list
          final waitingListData = {
            'selectedDate': selectedDate.value,
            'userId': user!.uid,
            'userEmail': user!.email,
            'phone': userPhone.value,
            'userName': userName.value,
            'Notification Time':
                notificationTimeSameDay.add(Duration(hours: -1)),
            'insertionTimestamp': FieldValue.serverTimestamp(),
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
            'Waiting List Full',
            'Sorry, no available appointments. The waiting list for this date is already full..',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.orange,
            colorText: Colors.black,
          );
        }
        logi.log(waitingListCount.toString());
        // Check if waiting list is not full
      } else {
        Get.snackbar(
          'Multiple Bookings Not Allowed',
          'You have already booked an appointment on the waiting list.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.black,
        );
      }
    } else if (selectedTimeAppointmentsCount > 0) {
      Get.snackbar(
        'Time Slot Not Available',
        'The selected time slot is already booked.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
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
        final QuerySnapshot<Map<String, dynamic>> userAppointmentsSnapshot =
            await datesCollection.where('userId', isEqualTo: user!.uid).get()
                as QuerySnapshot<Map<String, dynamic>>;
        final selectedDateStart =
            getStartOfDay(DateTime.parse(selectedDateString));
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
        if (selectedDate.value!.weekday == DateTime.monday ||
            selectedDate.value!.weekday == DateTime.friday) {
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
        final DateTime now = DateTime.now();
        bool isSameDay = selectedDate.value!.year == now.year &&
            selectedDate.value!.month == now.month &&
            selectedDate.value!.day == now.day;
        final reservationData = {
          'selectedDate': selectedDate.value,
          'userId': user!.uid,
          'userEmail': user!.email,
          'phone': userPhone.value,
          'userName': userName.value,
          'Notification Time': isSameDay
              ? notificationTimeSameDay.add(Duration(hours: -1))
              : notificationTime.add(Duration(hours: -1)),
          // Add more relevant data as needed
        };
        final dateDoc = await datesCollection.add(reservationData);
        print("Date saved successfully! Document ID: ${dateDoc.id}");
        Map<String, dynamic>? notificationData = {
          // Include any additional data you want to pass with the notification
        };
        // Check if the selected date is on the same day or not
        // ...

        //  final DateTime startOfToday = getStartOfDay(now);

        // Check if the selected date is on the same day or not
        // Check if the selected date is on the same day or not

        if (!isSameDay) {
          // If the appointment date is not on the same day, schedule a notification
          await notificationService.showNotification(
            id: randomID,
            notificationTime: notificationTime,
            title: notificationTitle,
            body: notificationBody,
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
        } else {
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
