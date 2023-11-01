import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Views/home.dart';
import 'package:flutterappoinmentapp/Views/terms_and_condition.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User?> checkCurrentUser() async {
      final user = FirebaseAuth.instance.currentUser;
      return user;
    }

    return FutureBuilder<User?>(
      future: checkCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final user = snapshot.data;

          if (user != null) {
            // User is already authenticated, navigate to the home screen
            return HomeScreen1();
          } else {
            // User not authenticated, show the login screen
            return TermsAndCondtion();
          }
        }

        return CircularProgressIndicator();
      },
    );
  }
}
