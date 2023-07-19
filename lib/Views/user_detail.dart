import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final List user;
  const UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user[0]),
              Text(user[1]),
              Text(user[2]),
              Text(user[3]),
              Text(user[4])
            ],
          ),
        ),
      ),
    );
  }
}
