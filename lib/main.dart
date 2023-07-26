import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterappoinmentapp/Auth/SignUpScreen.dart';
import 'package:get/get.dart';

import 'utils/Notification_service.dart';
import 'global_bindings.dart';
import 'utils/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GlobalBindings();

  NotificationService().initNotification();

  runApp(GetMaterialApp(
    home: const SignUpScreen(),
    translations: Translation(),
    locale: const Locale('ar'),
  ));
}
