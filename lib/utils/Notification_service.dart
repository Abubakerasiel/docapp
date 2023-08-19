//import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
//import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/data/latest.dart' as tzl;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> requestNotificationPermission() async {
    final messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission for notifications.');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User  granted provisinal permission .');
    } else {
      log('user delined or has not accepted premission');
    }
  }

  // Future<void> initNotification() async {
  //   // Android initialization
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var IOSInitialize = const DarwinInitializationSettings(
  //       requestAlertPermission: true,
  //       requestBadgePermission: true,
  //       requestSoundPermission: true);
  //   // ios initialization
  //   // final IOSInitializationSettings initializationSettingsIOS =
  //   // 	IOSInitializationSettings(
  //   // requestAlertPermission: false,
  //   // requestBadgePermission: false,
  //   // requestSoundPermission: false,
  //   // );

  //   InitializationSettings initializationSettings = InitializationSettings(
  //       android: initializationSettingsAndroid, iOS: IOSInitialize);
  //   // the initialization settings are initialized after they are setted
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }
  iniitInfo() async {
    var androidInitliaize = const AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );
    // ignore: non_constant_identifier_names
    var IOSInitialize = const DarwinInitializationSettings(
      requestCriticalPermission: true,
    );
    var initializationsSettings =
        InitializationSettings(android: androidInitliaize, iOS: IOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      // onDidReceiveBackgroundNotificationResponse: (details) =>
      //     Get.to(UserPage()),
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true);
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('dbfood', 'dbfood',
              importance: Importance.high,
              styleInformation: bigTextStyleInformation,
              priority: Priority.high,
              playSound: true);
      DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails(
        interruptionLevel: InterruptionLevel.timeSensitive,
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        presentBanner: true,
      );

      NotificationDetails platformchannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformchannelSpecifics,
          payload: message.data['body']);
    });
  }

// ...

// ...

// ...

  Future<void> showNotification({
    required DateTime notificationTime,
    required String title,
    required String body,
    required Map<String, dynamic>? data,
    required int id,
  }) async {
    tzl.initializeTimeZones();
    // String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    //  tz.Location location = tz.getLocation(timeZone);
    //   log(notificationTime.toString());
    var localTime = tz.TZDateTime.from(notificationTime, tz.local);
    //  log(a.toString());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      localTime,
      // tz.TZDateTime.now(tz.local).add(Duration(
      //     seconds: 1)), //schedule the notification to show after 2 seconds.
      const NotificationDetails(
          // Android details
          android: AndroidNotificationDetails('main_channel', 'Main Channel',
              channelDescription: "ashwin",
              importance: Importance.max,
              priority: Priority.max),
          iOS: DarwinNotificationDetails(
              interruptionLevel: InterruptionLevel.timeSensitive,
              presentAlert: true,
              presentSound: true,
              sound: 'default.wav',
              presentBadge: true)),

      // Type of time interpretation
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      // ignore: deprecated_member_use
      androidAllowWhileIdle:
          true, // To show notification even when the app is closed
    );
  }
}
