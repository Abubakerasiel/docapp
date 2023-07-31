import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterappoinmentapp/Auth/SignUpScreen.dart';
import 'package:get/get.dart';

import 'utils/Notification_service.dart';
import 'global_bindings.dart';
import 'utils/translation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  GlobalBindings();

  NotificationService().initNotification();

  runApp(GetMaterialApp(
    home: const SignUpScreen(),
    translations: Translation(),
    locale: const Locale('ar'),
  ));
}
