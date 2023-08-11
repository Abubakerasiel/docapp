import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterappoinmentapp/Views/terms_and_condition.dart';

import 'package:get/get.dart';

import 'utils/notification_service.dart';
import 'global_bindings.dart';
import 'utils/translation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  GlobalBindings();

  NotificationService().initNotification();

  runApp(GetMaterialApp(
    home: const TermsAndCondtion(),
    translations: Translation(),
    locale: const Locale('en'),
  ));
}
