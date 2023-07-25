import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/User.dart';
import '../controllers/Sign_In_Controller.dart';
import 'SignUpScreen.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SignIn Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!value.contains('@')) return 'Please enter valid email';

                    return null;
                  },
                  onSaved: (newValue) => controller.email = newValue,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 8) return 'please enter atleast 8 chars';

                    return null;
                  },
                  onSaved: (newValue) => controller.password = newValue,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: controller.signIn,
                  child: const Text('SignIn'),
                ),
                const SizedBox(height: 10),
                SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Create New Account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
