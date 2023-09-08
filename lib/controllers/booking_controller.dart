import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterappoinmentapp/Views/booking_confirm.dart';

import '../utils/notification_service.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'dart:math';
import 'dart:developer' as logi;

import 'home_controller.dart';

class ReservationController extends GetxController {
  final NotificationService notificationService = NotificationService();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() async {
    super.onInit();

    notificationService.iniitInfo();
    await retrieveUserData(user!.uid);
    await getDataFromFirestore();
    sendNotificatonToUser(user!.uid);
    // await requestNotificationPermission();
    await retrieveTokens();
    await getUserToken();

    //iniitInfo();
  }

  RxString userName = ''.obs;
  RxString userPhone = RxString('');
  RxString medicalIssue = RxString('');
  RxString weight = ''.obs;

  RxString age = RxString('');
  RxString height = RxString('');
  RxString gender = RxString('');
  RxString packageType = RxString('');

  RxInt package = 0.obs;
  RxBool y = false.obs;
  String? userToken;
  List? all;
  List? tak;
  RxBool sundayTimeShowing = false.obs;
  RxBool tuesTimeShowing = false.obs;
  RxBool mondayTimeShowing = false.obs;
  RxBool wednesdayTimeShowing = false.obs;
  RxBool thursdayTimeShowing = false.obs;

  RxBool Sturaday11 = false.obs;
  RxBool Sturaday12 = false.obs;
  RxBool Sturaday1 = false.obs;
  RxBool Sturaday2 = false.obs;
  RxBool Sturaday3 = false.obs;
  RxBool Sturaday4 = false.obs;
  RxBool Sturaday5 = false.obs;
  RxBool Sturaday6 = false.obs;
  RxBool Sturaday7 = false.obs;
  RxBool Sturaday8 = false.obs;
  RxBool Sturaday9 = false.obs;
  RxBool Sturaday10 = false.obs;
  RxBool Sturaday11am = false.obs;
  RxBool Sturaday12am = false.obs;
  RxBool Sunday11 = false.obs;
  RxBool Sunday12 = false.obs;
  RxBool Sunday1 = false.obs;
  RxBool Sunday2 = false.obs;
  RxBool Sunday3 = false.obs;
  RxBool Sunday4 = false.obs;
  RxBool Sunday5 = false.obs;
  RxBool Sunday6 = false.obs;
  RxBool Sunday7 = false.obs;
  RxBool Sunday8 = false.obs;
  RxBool Sunday9 = false.obs;
  RxBool Sunday10 = false.obs;
  RxBool Sunday11am = false.obs;
  RxBool Sunday12am = false.obs;
  RxBool Monday11 = false.obs;
  RxBool Monday12 = false.obs;
  RxBool Monday1 = false.obs;
  RxBool Monday2 = false.obs;
  RxBool Monday3 = false.obs;
  RxBool Monday4 = false.obs;
  RxBool Monday5 = false.obs;
  RxBool Monday6 = false.obs;
  RxBool Monday7 = false.obs;
  RxBool Monday8 = false.obs;
  RxBool Monday9 = false.obs;
  RxBool Monday10 = false.obs;
  RxBool Monday11am = false.obs;
  RxBool Monday12am = false.obs;
  RxBool Tuesday11 = false.obs;
  RxBool Tuesday12 = false.obs;
  RxBool Tuesday1 = false.obs;
  RxBool Tuesday2 = false.obs;
  RxBool Tuesday3 = false.obs;
  RxBool Tuesday4 = false.obs;
  RxBool Tuesday5 = false.obs;
  RxBool Tuesday6 = false.obs;
  RxBool Tuesday7 = false.obs;
  RxBool Tuesday8 = false.obs;
  RxBool Tuesday9 = false.obs;
  RxBool Tuesday10 = false.obs;
  RxBool Tuesday11am = false.obs;
  RxBool Tuesday12am = false.obs;
  RxBool Wedneseday11 = false.obs;
  RxBool Wedneseday12 = false.obs;
  RxBool Wedneseday1 = false.obs;
  RxBool Wedneseday2 = false.obs;
  RxBool Wedneseday3 = false.obs;
  RxBool Wedneseday4 = false.obs;
  RxBool Wedneseday5 = false.obs;
  RxBool Wedneseday6 = false.obs;
  RxBool Wedneseday7 = false.obs;
  RxBool Wedneseday8 = false.obs;
  RxBool Wedneseday9 = false.obs;
  RxBool Wedneseday10 = false.obs;
  RxBool Wedneseday11am = false.obs;
  RxBool Wedneseday12am = false.obs;
  RxBool Thrusday11 = false.obs;
  RxBool Thrusday12 = false.obs;
  RxBool Thrusday1 = false.obs;
  RxBool Thrusday2 = false.obs;
  RxBool Thrusday3 = false.obs;
  RxBool Thrusday4 = false.obs;
  RxBool Thrusday5 = false.obs;
  RxBool Thrusday6 = false.obs;
  RxBool Thrusday7 = false.obs;
  RxBool Thrusday8 = false.obs;
  RxBool Thrusday9 = false.obs;
  RxBool Thrusday10 = false.obs;
  RxBool Thrusday11am = false.obs;
  RxBool Thrusday12am = false.obs;

  RxBool disableSunday = false.obs;
  RxBool disableMonday = false.obs;
  RxBool disableTuesday = false.obs;
  RxBool disableSaturday = false.obs;
  RxBool disableWednesday = false.obs;
  RxBool disableThursday = false.obs;

  TextEditingController stat = TextEditingController();

  final usersRef = FirebaseFirestore.instance.collection('users');
  final docTime = FirebaseFirestore.instance.collection('time_visibalilty');

  final User? user = FirebaseAuth.instance.currentUser;

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dates = RxList([]);
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> fuser = RxList([]);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  CollectionReference datesCollection =
      FirebaseFirestore.instance.collection('dates');

  String formatDateTime(DateTime date, String userName, String? userPhone) {
    final hour = date.hour + 1;
    final a = hour.toString();
    final formattedDate =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}   Time ${a.toString().padLeft(2, '0')}/${date.minute.toString().padLeft(2, '0')}';

    return ' Name: $userName       Date : $formattedDate   Phone Number:$userPhone ';
  }

  Future<String?> getUserToken() async {
    // logi.log(isSaturday1H.value.toString());
    String? token;
    try {
      // Request for the user's token
      token = await FirebaseMessaging.instance.getToken();
      userToken = token;
    } catch (e) {
      logi.log('Error getting user token: $e');
    }
    return token;
  }

  int generateRandomID(int length) {
    final random = Random();
    int id = 0;
    for (int i = 0; i < length; i++) {
      id += random.nextInt(10);
    }
    return id;
  }

  Future<void> getDataFromFirestore() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await docTime.doc('WTMfaIqjFuL686hKuK9h').get();

      if (snapshot.exists) {
        // Data is retrieved successfully
        final data = snapshot.data();

        // Store each field value in separate variables

        Sturaday11.value = data!['  Sturaday11'];
        Sturaday12.value = data['  Sturaday12'] ?? false;
        Sturaday1.value = data['  Sturaday1'] ?? false;
        Sturaday2.value = data['  Sturaday2'] ?? false;
        Sturaday3.value = data['  Sturaday3'] ?? false;
        Sturaday4.value = data['  Sturaday4'] ?? false;
        Sturaday5.value = data['  Sturaday5'] ?? false;
        Sturaday6.value = data['  Sturaday6'] ?? false;
        Sturaday7.value = data['  Sturaday7'] ?? false;
        Sturaday8.value = data['  Sturaday8'] ?? false;
        Sturaday9.value = data['  Sturaday9'] ?? false;
        Sturaday10.value = data['  Sturaday10'] ?? false;
        Sturaday11am.value = data['  Sturaday11am'] ?? false;
        Sturaday12am.value = data['  Sturaday12am'] ?? false;
        Sunday11.value = data['Sunday11'] ?? false;
        Sunday12.value = data['Sunday12'] ?? false;
        Sunday1.value = data['Sunday1 '] ?? false;
        Sunday2.value = data['Sunday2'] ?? false;
        Sunday3.value = data['Sunday3'] ?? false;
        Sunday4.value = data['Sunday4'] ?? false;
        Sunday5.value = data['Sunday5'] ?? false;
        Sunday6.value = data['Sunday6'] ?? false;
        Sunday7.value = data['Sunday7'] ?? false;
        Sunday8.value = data['Sunday8'] ?? false;
        Sunday9.value = data['Sunday9'] ?? false;
        Sunday10.value = data['Sunday10'] ?? false;
        Sunday11am.value = data['Sunday11am'] ?? false;
        Sunday12am.value = data['Sunday12am'] ?? false;
        Monday11.value = data[' Monday11'] ?? false;
        Monday12.value = data[' Monday12'] ?? false;
        Monday1.value = data[' Monday1'] ?? false;
        Monday2.value = data[' Monday2'] ?? false;
        Monday3.value = data[' Monday3'] ?? false;
        Monday4.value = data[' Monday4'] ?? false;
        Monday5.value = data[' Monday5'] ?? false;
        Monday6.value = data[' Monday6'] ?? false;
        Monday7.value = data[' Monday7'] ?? false;
        Monday8.value = data[' Monday8'] ?? false;
        Monday9.value = data[' Monday9'] ?? false;
        Monday10.value = data[' Monday10'] ?? false;
        Monday11am.value = data[' Monday11am'] ?? false;
        Monday12am.value = data[' Monday12am'] ?? false;
        Tuesday11.value = data[' Tuesday11'] ?? false;
        Tuesday12.value = data[' Tuesday12'] ?? false;
        Tuesday1.value = data[' Tuesday1'] ?? false;
        Tuesday2.value = data[' Tuesday2'] ?? false;
        Tuesday3.value = data[' Tuesday3'] ?? false;
        Tuesday4.value = data[' Tuesday4'] ?? false;
        Tuesday5.value = data[' Tuesday5'] ?? false;
        Tuesday6.value = data[' Tuesday6'] ?? false;
        Tuesday7.value = data[' Tuesday7'] ?? false;
        Tuesday8.value = data[' Tuesday8'] ?? false;
        Tuesday9.value = data[' Tuesday9'] ?? false;
        Tuesday10.value = data[' Tuesday10'] ?? false;
        Tuesday11am.value = data[' Tuesday11am'] ?? false;
        Tuesday12am.value = data[' Tuesday12am'] ?? false;
        Wedneseday11.value = data[' Wedneseday11'] ?? false;
        Wedneseday12.value = data[' Wedneseday12'] ?? false;
        Wedneseday1.value = data[' Wedneseday1'] ?? false;
        Wedneseday2.value = data[' Wedneseday2'] ?? false;
        Wedneseday3.value = data[' Wedneseday3'] ?? false;
        Wedneseday4.value = data[' Wedneseday4'] ?? false;
        Wedneseday5.value = data[' Wedneseday5'] ?? false;
        Wedneseday6.value = data[' Wedneseday6'] ?? false;
        Wedneseday7.value = data[' Wedneseday7'] ?? false;
        Wedneseday8.value = data[' Wedneseday8'] ?? false;
        Wedneseday9.value = data[' Wedneseday9'] ?? false;
        Wedneseday10.value = data[' Wedneseday10'] ?? false;
        Wedneseday11am.value = data[' Wedneseday11am'] ?? false;
        Wedneseday12am.value = data[' Wedneseday12am'] ?? false;
        Thrusday11.value = data['Thrusday11 '] ?? false;
        Thrusday12.value = data['Thrusday12'] ?? false;
        Thrusday1.value = data['Thrusday1'] ?? false;
        Thrusday2.value = data['Thrusday2'] ?? false;
        Thrusday3.value = data['Thrusday3'] ?? false;
        Thrusday4.value = data['Thrusday4'] ?? false;
        Thrusday5.value = data['Thrusday5'] ?? false;
        Thrusday6.value = data['Thrusday6'] ?? false;
        Thrusday7.value = data['Thrusday7'] ?? false;
        Thrusday8.value = data['Thrusday8'] ?? false;
        Thrusday9.value = data['Thrusday9'] ?? false;
        Thrusday10.value = data['Thrusday10'] ?? false;
        Thrusday11am.value = data['Thrusday11am'] ?? false;
        Thrusday12am.value = data['Thrusday12am'] ?? false;

        disableSaturday.value = data['saturdayDisabled'];
        disableSunday.value = data['sundayDisabled'];
        disableMonday.value = data['mondayDisabled'];
        disableTuesday.value = data['tuesdayDisabled'];
        disableWednesday.value = data['disableWednesday'];
        disableThursday.value = data['disableThursday'];
      } else {
        logi.log('Document not found!');
      }
    } catch (e) {
      logi.log('Error getting document: $e');
    }
  }

  Future<Map<String, dynamic>?> retrieveTokens() async {
    final QuerySnapshot<Map<String, dynamic>> tok =
        await FirebaseFirestore.instance.collection('UserTokes').get();
    all = tok.docs.cast<QueryDocumentSnapshot<Map<String, dynamic>>>();

    final List<Map<String, dynamic>> todayAppointments =
        tok.docs.map((doc) => doc.data()).toList();
    all = todayAppointments;
    List<dynamic> tokens2 = all!.map((element) => element["token"]).toList();
    tak = tokens2;

    logi.log(tak.toString());
    return null;
  }

  Future<void> sendNotificationToWaitlingListUser(
      List<String> tokens, String body, String title, DateTime sendTime) async {
    // Calculate the duration from the current time to the desired send time.
    Duration delayDuration = sendTime.difference(DateTime.now());

    // If the specified time is in the past, handle the error scenario.
    if (delayDuration.isNegative) {
      logi.log("Specified time is in the past. Notifications won't be sent.");
      return;
    }

    // Wait for the specified duration before sending the notifications.
    await Future.delayed(delayDuration);

    for (var token in tokens) {
      logi.log(token);
      try {
        // ... The remaining code for sending the notifications remains unchanged ...
      } catch (e) {
        if (kDebugMode) {
          print('error push notification');
        }
      }
    }
  }

  sendAllUsersNotfication(List tokens, String body, String title) async {
    for (var token in tokens) {
      logi.log(token);
      try {
        await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization':
                  'key=AAAAMOw-JhE:APA91bHdnYOR7tMhNZ2R4WWMR6W8UG8wU8hH-OPz_CDKURfD6AjeqLG8o1e7HIqaLjI76FjLh5qVwoA0_4jtQTC4rJEbnluWVmRUgwSNc6p_qZQQu5aV7okGIG739HQF_apE1e9FCzY9'
            },
            body: jsonEncode(<String, dynamic>{
              'priority': 'high',
              'data': <String, dynamic>{
                'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                'status': 'done',
                'body': body,
                'title': title,
              },
              'notification': <String, dynamic>{
                'title': title,
                'body': body,
                'android_channel_id': 'dbfood'
              },
              'to': token
            }));
      } catch (e) {
        if (kDebugMode) {
          print('error push notfication');
        }
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
            .orderBy('selectedDate')
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
        DateTime(now.year, now.month, now.day, 12, 0, 0);
    final DateTime endOfToday =
        DateTime(now.year, now.month, now.day, 11, 59, 59)
            .add(const Duration(hours: 12));

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
      // Fetch data from the Firestore collection named 'datesCollection'
      final snapshot = await datesCollection.orderBy('selectedDate').get();

      // Store the fetched and ordered data in the 'dates' variable
      dates.value =
          snapshot.docs.cast<QueryDocumentSnapshot<Map<String, dynamic>>>();
    } catch (error) {
      // Handle any errors that occur during fetching
      logi.log("Failed to fetch dates: $error");
    }
  }

  void sendNotificatonToUser(String userID1) async {
    // ignore: prefer_typing_uninitialized_variables
    var package2;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID1).get();
    if (snapshot.exists) {
      package2 = snapshot.data()?['package'];
      //   return snapshot.data();
    }

    if (package2 != null && package2 < 3) {
      await notificationService.showNotification(
        id: generateRandomID(8),
        notificationTime: DateTime.now().add(const Duration(minutes: 1)),
        title: 'Package Reminder Update'.tr,
        body: 'Hello please  pay  for your pakacge.'.tr,
        data: null,
      );
    }
  }

  paidPackge(String userID1) async {
    // ignore: prefer_typing_uninitialized_variables
    var package2;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID1).get();
    if (snapshot.exists) {
      package2 = snapshot.data()?['package'];
      package2 += 5;

      //   return snapshot.data();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID1)
        .update({'package': package2});
  }

  paymentStatus(String userID1) async {
    // ignore: prefer_typing_uninitialized_variables
    late var package3;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID1).get();
    if (snapshot.exists) {
      package3 = snapshot.data()?['package'];
      if (package3 >= 3) {
        y.value = true;
      } else if (package3 < 3) {
        y.value = false;
      }

      //   return snapshot.data();
    }
  }

  void saveTextToFirebase(String text, Timestamp timestamp) async {
    FirebaseFirestore.instance
        .collection('userText')
        .add({
          'text': text,
          'timestamp': timestamp,
        })
        .then((value) => logi.log('Text saved to Firebase'))
        .catchError((error) => logi.log('Failed to save text: $error'));
  }

  Future<Map<String, dynamic>?> retrieveUserData(String userId) async {
    //print('jkkkk');
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
        package.value = snapshot.data()?['package'];
        medicalIssue.value = snapshot.data()?['medical_issue'];
        packageType.value = snapshot.data()?['packageType'];
        return snapshot.data();
      } else {
        logi.log('User document does not exist');
        return null;
      }
    } catch (e) {
      logi.log('Error retrieving user data: $e');
      return null;
    }
  }

  void deleteDate(String documentId) async {
    // ignore: prefer_typing_uninitialized_variables
    var userIdInDateColletion;

    await FirebaseFirestore.instance
        .collection('dates')
        .doc(documentId)
        .get() // Get the document data
        .then((docSnapshot) {
      if (docSnapshot.exists) {
        String userId = docSnapshot.data()!['userId'];
        userIdInDateColletion = userId;
        // Access the user ID field
        // Now you have the user ID and can use it for any further operations if needed
        logi.log('User ID: $userId');
        logi.log(userIdInDateColletion);
      } else {
        logi.log('Document not found.');
      }
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error) => logi.log('Error getting document: $error'));

    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userIdInDateColletion)
            .get();
    if (snapshot.exists) {
      package.value = snapshot.data()?['package'];
      //   return snapshot.data();
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userIdInDateColletion)
        .update({'package': package.value - 1});

    FirebaseFirestore.instance
        .collection('dates')
        .doc(documentId)
        .delete()
        .then((value) => logi.log('Date deleted'))
        .catchError((error) => logi.log('Failed to delete date: $error'));
  }

  void deleteDateAndReplaceIt(String documentId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await datesCollection.doc(documentId).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      final Map<String, dynamic> appointmentData =
          documentSnapshot.data() ?? {};

      if (appointmentData.isNotEmpty) {
        DateTime selectedDate = appointmentData['selectedDate'].toDate();
        DateTime now = DateTime.now();
        Duration timeDifference = selectedDate.difference(now);

        if (timeDifference.inHours >= 24) {
          // Delete the appointment document
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
            print('Waiting list has entries 55');
            print('selectedDate: $selectedDate');
            // Find the first waiting list entry with the same date as the deleted appointment
            for (var doc in waitingListDocs) {
              final DateTime waitingListSelectedDate =
                  doc.data()['selectedDate'].toDate();
              final DateTime waitingListDateOnly = DateTime(
                waitingListSelectedDate.year,
                waitingListSelectedDate.month,
                waitingListSelectedDate.day,
              );
              selectedDate = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
              );

              print(waitingListDateOnly.toString());
              if (selectedDate.isAtSameMomentAs(waitingListDateOnly)) {
                print('true');
                waitingListDoc = doc;
                break;
              }
            }

            if (waitingListDoc != null) {
              print('iam in');
              final String waitingListDocId = waitingListDoc.id;

              // Retrieve the waiting list data
              final Map<String, dynamic> waitingListData =
                  waitingListDoc.data();

              // Delete the waiting list entry
              await waitingListCollection.doc(waitingListDocId).delete();

              // Assign the waiting list user to the freed appointment slot
              final Map<String, dynamic> waitingListReservationData = {
                'selectedDate': waitingListData['selectedDate'],
                'userId': waitingListData['userId'],
                'userEmail': waitingListData['userEmail'],
                'phone': waitingListData['phone'],
                'userName': waitingListData['userName'],
                'Notification Time': waitingListData['Notification Time'],
              };

              // Replace the appointment with the waiting list entry
              await datesCollection.add(waitingListReservationData);
              logi.log(
                  "Waiting list user assigned to the freed appointment slot.");

              // Show a notification for the replacement
              print(waitingListData['user token']);
              //    Send a notification at the moment of replacement
              await sendAllUsersNotfication(
                  [waitingListData['user token']],
                  'Your date has been confirmed on'
                      '${waitingListData['selectedDate']}',
                  'booking confimation');

              void scheduleNotification(DateTime notificationTime) {
                var currentTime = DateTime.now();
                var timeDifference = notificationTime.difference(currentTime);

                if (timeDifference.isNegative) {
                  print("The specified time has already passed.");
                  return;
                }

                Timer(timeDifference, () {
                  sendAllUsersNotfication(
                      [waitingListData['user token']],
                      'Your appointment is coming up in 24 hours'.tr,
                      'booking Reminder'.tr);
                });
              }

              scheduleNotification(waitingListData['Notification Time']);
            } else {
              print('no data');
            }
          }
        } else {
          Get.snackbar(
            'Deleting Not Allowed'.tr,
            'Cannot delete appointment less than 24 hours away.'.tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
            colorText: Colors.black,
          );
          //  ('Cannot delete appointment less than 24 hours away.');
        }
      }
    } catch (error) {
      logi.log('Failed to delete or replace appointment: $error');
    }
  }

  void makeReservation() async {
    bool isSelectedDateMonday =
        selectedDate.value != null && (selectedDate.value!.weekday == 1);
    bool isSelectedDateSunday =
        selectedDate.value != null && (selectedDate.value!.weekday == 7);

    bool isSelectedDateTuesday =
        selectedDate.value != null && (selectedDate.value!.weekday == 2);
    bool isSelectedDateSaturday =
        selectedDate.value != null && (selectedDate.value!.weekday == 6);
    DateTime getStartOfDay(DateTime date) {
      return DateTime(date.year, date.month, date.day, 12, 0, 0);
    }

    DateTime getEndOfDay(DateTime date) {
      return DateTime(date.year, date.month, date.day, 11, 59, 59)
          .add(const Duration(hours: 12));
    }

    // DateTime getEndOfDay2(DateTime date) {
    //   return DateTime(date.year, date.month, date.day, 11, 59, 59);
    // }

    int randomID = generateRandomID(8);

    // final String selectedDateString = dateFormatter.format(selectedDate.value!
    //         .add(const Duration(hours: 12)) // Add 12 hours to switch to PM
    //     );

    final DateTime notificationTime =
        selectedDate.value!.subtract(const Duration(hours: 12));

    final DateTime notificationTimeSameDay =
        selectedDate.value!.subtract(const Duration(hours: 3));

    selectedDate.value = selectedDate.value!.add(const Duration(hours: -1));

    final notificationTitle = 'Reservation Reminder'.tr;
    final notificationBody =
        'Hello  Your appointment is coming up in 24 hours.'.tr;
    final notificationBody2 =
        'Hello  Your appointment is coming up in 3 hours.'.tr;

    //  const int maxAppointmentsPerDay = 34;
    final selectedDateStart = getStartOfDay(selectedDate.value!);
    final selectedDateEnd = getEndOfDay(selectedDate.value!);

    // Check if the maximum number of appointments for the day (4) has been reached
    final QuerySnapshot<Map<String, dynamic>> existingAppointmentsSnapshot =
        await datesCollection
            .where('selectedDate',
                isGreaterThan: selectedDateStart, isLessThan: selectedDateEnd)
            .get() as QuerySnapshot<Map<String, dynamic>>;
    final int existingAppointmentsCount = existingAppointmentsSnapshot.size;

    final QuerySnapshot<Map<String, dynamic>> selectedTimeAppointmentsSnapshot =
        await datesCollection
            .where('selectedDate',
                isEqualTo: selectedDate.value!.add(const Duration(hours: 12)))
            .get() as QuerySnapshot<Map<String, dynamic>>;
    final int selectedTimeAppointmentsCount =
        selectedTimeAppointmentsSnapshot.size;
    logi.log(selectedTimeAppointmentsCount.toString());

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

    if (existingAppointmentsCount >= 38 && isSelectedDateSaturday ||
        existingAppointmentsCount >= 24 && isSelectedDateSunday ||
        existingAppointmentsCount >= 26 && isSelectedDateMonday ||
        existingAppointmentsCount >= 26 && isSelectedDateTuesday) {
      if (userWaitingListCount == 0) {
        if (waitingListCount < 5) {
          // Add the user to the waiting list
          final waitingListData = {
            'selectedDate': selectedDate.value!.add(Duration(hours: 12)),
            'userId': user!.uid,
            'userEmail': user!.email,
            'phone': userPhone.value,
            'userName': userName.value,
            'Notification Time':
                notificationTime.add(const Duration(hours: -1)),
            'insertionTimestamp': FieldValue.serverTimestamp(),
            'user token': userToken
          };

          await waitingListCollection.add(waitingListData);
          Get.snackbar(
            'Waiting List'.tr,
            'Sorry, no available appointments on this day. You have been added to the waiting list.'
                .tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.yellow,
            colorText: Colors.black,
          );
          await notificationService.showNotification(
            id: generateRandomID(8),
            notificationTime: notificationTimeSameDay,
            title: 'Waiting List'.tr,
            body:
                // 'Hello ${userName.value}! You have been added to the waiting list.',
                'Hello  You have been added to the waiting list.'.tr,
            data: null,
          );
        } else {
          Get.snackbar(
            'Waiting List Full'.tr,
            'Sorry, no available appointments. The waiting list for this date is already full..'
                .tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.orange,
            colorText: Colors.black,
          );
        }
        logi.log(waitingListCount.toString());
        // Check if waiting list is not full
      } else {
        Get.snackbar(
          'Multiple Bookings Not Allowed'.tr,
          'You have already booked an appointment on the waiting list.'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.black,
        );
      }
    } else if (selectedTimeAppointmentsCount > 0) {
      // print("Time slot is already booked.");
      // print('biko12');
      // print(selectedDate.value!);
      Get.snackbar(
        'Time Slot Not Available '.tr,
        'The selected time slot is already booked.'.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
      );
    } else {
      logi.log("Time slot is available.");
      if (selectedDate.value != null) {
        if (selectedDate.value!.isBefore(DateTime.now())) {
          Get.snackbar(
            'Invalid Date'.tr,
            'Please select a future date and time.'.tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
          return;
        }
        final QuerySnapshot<Map<String, dynamic>> userAppointmentsSnapshot =
            await datesCollection.where('userId', isEqualTo: user!.uid).get()
                as QuerySnapshot<Map<String, dynamic>>;

        bool userAlreadyBookedForWeek = false;
        final selectedWeek = selectedDate.value!
            .subtract(Duration(days: selectedDate.value!.weekday - 1));

        for (final doc in userAppointmentsSnapshot.docs) {
          final appointmentDate = doc['selectedDate'].toDate() as DateTime;
          final appointmentWeek = appointmentDate
              .subtract(Duration(days: appointmentDate.weekday - 1));

          if (appointmentWeek.year == selectedWeek.year &&
              appointmentWeek.month == selectedWeek.month &&
              appointmentWeek.day == selectedWeek.day) {
            userAlreadyBookedForWeek = true;
            break;
          }
        }

        if (userAlreadyBookedForWeek) {
          Get.snackbar(
            'Multiple Bookings In Same Week Not Allowed'.tr,
            'You have already booked an appointment on the selected Week.'.tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
          return;
        }

        final DateTime now = DateTime.now();
        bool isSameDay = selectedDate.value!.year == now.year &&
            selectedDate.value!.month == now.month &&
            selectedDate.value!.day == now.day;
        logi.log(selectedDate.value!.toString());

        final reservationData = {
          //  dateFormatter.parse(selectedDateString).add(Duration(hours: -1)),
          'selectedDate': selectedDate.value!.add(Duration(hours: 12)),
          'userId': user!.uid,
          'userEmail': user!.email,
          'phone': userPhone.value,
          'userName': userName.value,
          'Notification Time': isSameDay
              ? notificationTimeSameDay.add(const Duration(hours: -1))
              : notificationTime.add(const Duration(hours: -1)),
          // Add more relevant data as needed
        };
        final dateDoc = await datesCollection.add(reservationData);
        logi.log("Date saved successfully! Document ID: ${dateDoc.id}");
        Map<String, dynamic>? notificationData = {
          // Include any additional data you want to pass with the notification
        };

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
            'Successful booking'.tr,
            'You have successfully booked your appointment'.tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white,
          );
          Get.to(() => const BookingConfirmed(),
              arguments: selectedDate,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              transition: Transition.native);
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
            'Successful booking'.tr,
            'You have successfully booked your appointment'.tr,
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.greenAccent,
            colorText: Colors.white,
          );
          Get.to(() => const BookingConfirmed(),
              arguments: selectedDate,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              transition: Transition.native);
        }
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text('Error'),
            content: const Text('Please select a date and time.'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}
