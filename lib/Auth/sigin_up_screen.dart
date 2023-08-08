import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Auth/sigin_screen.dart';

import 'package:get/get.dart';

import '../Views/constanst.dart';
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
      // appBar: AppBar(
      //   title: Text('Sign Up'.tr),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppConstants.appColor,
                      fontSize: 30),
                )),
                const SizedBox(
                  height: 10,
                ),
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
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Full Name'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name'.tr;
                        }

                        return null;
                      },
                      onSaved: (newValue) =>
                          controller.newUser!.name = newValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email'.tr;
                        }
                        if (!value.contains('@'))
                          return 'Please enter valid email'.tr;

                        return null;
                      },
                      onSaved: (newValue) =>
                          controller.newUser!.email = newValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Age'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age'.tr;
                        }

                        return null;
                      },
                      onSaved: (newValue) => controller.newUser!.age = newValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Height'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Height'.tr;
                        }

                        return null;
                      },
                      onSaved: (newValue) =>
                          controller.newUser!.height = newValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Weight'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter weight'.tr;
                        }

                        return null;
                      },
                      onSaved: (newValue) =>
                          controller.newUser!.weight = newValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<Gender>(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff2282B7)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: 'Select Gender'.tr,
                      fillColor: Colors.white),
                  elevation: 5,
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select you gender'.tr;
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
                  // decoration: InputDecoration(
                  //   hintText: 'Select Gender'.tr,
                  // ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number'.tr,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number'.tr;
                        }
                        if (value.length < 8)
                          return 'please enter atleast 8 chars'.tr;

                        return null;
                      },
                      onSaved: (newValue) =>
                          controller.newUser!.phone = newValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                        hintText:
                            'Medical Issue   if you dont have any Write None'
                                .tr,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'if You have any medical issue please write them down if not write none'
                              .tr;
                        }

                        return null;
                      },
                      onSaved: (newValue) =>
                          controller.newUser!.medical_issue = newValue,
                    ),
                  ),
                ),
                //  const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: AppConstants.appColor),
                    ),
                  ),
                  onPressed: controller.createAccount,
                  child: Text(
                    'Create New Account'.tr,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppConstants.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: AppConstants.appColor),
                    ),
                  ),
                  onPressed: () {
                    Get.to(const SignInScreen1());
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
