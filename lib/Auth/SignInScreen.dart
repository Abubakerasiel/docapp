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

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'.tr),
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
                decoration: InputDecoration(hintText: 'email'.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email'.tr;
                  }
                  if (!value.contains('@')) return 'Please enter valid email';

                  return null;
                },
                onSaved: (newValue) => controller.email = newValue,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'password'.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password'.tr;
                  }
                  if (value.length < 8)
                    return 'please enter atleast 8 chars'.tr;

                  return null;
                },
                onSaved: (newValue) => controller.password = newValue,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: controller.signIn,
                child: Text('Sign In'.tr),
              ),
              const SizedBox(height: 10),
              SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Create New Account'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Get.locale!.languageCode == "ar") {
            Get.updateLocale(const Locale("en"));
            return;
          }
          Get.updateLocale(const Locale("ar"));
        },
        child: Icon(Icons.g_translate),
      ),
    );
  }
}
