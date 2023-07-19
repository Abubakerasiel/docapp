import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterappoinmentapp/Auth/SignUpScreen.dart';

import 'Notification_service.dart';
import 'global_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GlobalBindings();

  NotificationService().initNotification();

  runApp(const SignUpScreen());
}
