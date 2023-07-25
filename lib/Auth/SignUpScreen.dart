import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Auth/SignInScreen.dart';
import 'package:get/get.dart';

import '../controllers/Sign_up_Controller.dart';

enum Gender {
  male,
  female;

  Color get color {
    switch (this) {
      case Gender.male:
        return Colors.red;
      case Gender.female:
        return Colors.blue;
    }
  }

  IconData get icon {
    switch (this) {
      case Gender.male:
        return Icons.male;
      case Gender.female:
        return Icons.female;
    }
  }
}

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // GestureDetector(
                //   onTap: () async {
                //     controller.userSelectedImage =
                //         await controller.pickImage();
                //     controller.update();
                //   },
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     clipBehavior: Clip.antiAlias,
                //     decoration: BoxDecoration(
                //       color: Colors.grey.shade200,
                //       shape: BoxShape.circle,
                //     ),
                //     child: controller.userSelectedImage != null
                //         ? Image.file(controller.userSelectedImage!)
                //         : const Icon(Icons.person),
                //   ),
                // ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter age';
                    }

                    return null;
                  },
                  onSaved: (newValue) => controller.newUser!.name = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'email'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!value.contains('@')) return 'Please enter valid email';

                    return null;
                  },
                  onSaved: (newValue) => controller.newUser!.email = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Age'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }

                    return null;
                  },
                  onSaved: (newValue) => controller.newUser!.age = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Height'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Height';
                    }

                    return null;
                  },
                  onSaved: (newValue) => controller.newUser!.height = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Weight'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter weight';
                    }

                    return null;
                  },
                  onSaved: (newValue) => controller.newUser!.weight = newValue,
                ),
                DropdownButtonFormField<Gender>(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select you gender';
                    }

                    return null;
                  },
                  onChanged: (newValue) {
                    controller.newUser?.gender = newValue;
                  },
                  onSaved: (newValue) => controller.newUser!.gender = newValue,
                  items: [
                    DropdownMenuItem<Gender>(
                      value: Gender.male,
                      child: Text('Male'.tr),
                    ),
                    DropdownMenuItem<Gender>(
                      value: Gender.female,
                      child: Text('Female'.tr),
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Select Gender'.tr,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 8) return 'please enter atleast 8 chars';

                    return null;
                  },
                  onSaved: (newValue) => controller.password = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Phone'.tr),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone';
                    }
                    if (value.length < 8) return 'please enter atleast 8 chars';

                    return null;
                  },
                  onSaved: (newValue) => controller.newUser!.phone = newValue,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'medical issue'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'if You have any medical issue please write it down';
                    }

                    return null;
                  },
                  onSaved: (newValue) =>
                      controller.newUser!.medical_issue = newValue,
                ),
                //  const Spacer(),
                ElevatedButton(
                  onPressed: controller.createAccount,
                  child: Text('Create New Account'.tr),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(SignInScreen());
                  },
                  child: Text('Sign in'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
