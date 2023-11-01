import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterappoinmentapp/Auth/first.dart';

import 'package:get/get.dart';

import 'utils/notification_service.dart';
import 'global_bindings.dart';
import 'utils/translation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAYmgkd-f6kzFJwKWOioow1bYSeQDAc7Gw',
    appId: '1:210121926161:android:d18622becb3abdfe2273b0',
    messagingSenderId: '210121926161',
    projectId: 'doctorapp-6c1c8',
  ));
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  GlobalBindings();

  NotificationService().iniitInfo();
  NotificationService().requestNotificationPermission();

  runApp(GetMaterialApp(
    home: InitialScreen(),
    translations: Translation(),
    locale: const Locale('en'),
  ));
}
