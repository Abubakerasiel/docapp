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

    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SignUPcreen'),
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
                    decoration: const InputDecoration(hintText: 'name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter age';
                      }

                      return null;
                    },
                    onSaved: (newValue) => controller.newUser!.name = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if (!value.contains('@'))
                        return 'Please enter valid email';

                      return null;
                    },
                    onSaved: (newValue) => controller.newUser!.email = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'age'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }

                      return null;
                    },
                    onSaved: (newValue) => controller.newUser!.age = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Height'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Height';
                      }

                      return null;
                    },
                    onSaved: (newValue) =>
                        controller.newUser!.height = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'weight'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter weight';
                      }

                      return null;
                    },
                    onSaved: (newValue) =>
                        controller.newUser!.weight = newValue,
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
                    onSaved: (newValue) =>
                        controller.newUser!.gender = newValue,
                    items: const [
                      DropdownMenuItem<Gender>(
                        value: Gender.male,
                        child: Text('Male'),
                      ),
                      DropdownMenuItem<Gender>(
                        value: Gender.female,
                        child: Text('Female'),
                      ),
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Select Gender',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8)
                        return 'please enter atleast 8 chars';

                      return null;
                    },
                    onSaved: (newValue) => controller.password = newValue,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone';
                      }
                      if (value.length < 8)
                        return 'please enter atleast 8 chars';

                      return null;
                    },
                    onSaved: (newValue) => controller.newUser!.phone = newValue,
                  ),
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'medical issue',
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
                    child: const Text('Create New Accout'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(SignInScreen());
                    },
                    child: const Text('Sign in '),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
