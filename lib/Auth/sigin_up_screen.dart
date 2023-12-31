import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Auth/sigin_screen.dart';

import 'package:get/get.dart';

import '../Views/constanst.dart';
import '../controllers/sign_up_controller.dart';

enum PackageType { byPackage, byTime }

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

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({Key? key}) : super(key: key);

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  bool? x;
  @override
  void initState() {
    super.initState();
    x = true;
  }

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth > 500 ? 500 : double.infinity,
            child: SingleChildScrollView(
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

                      SizedBox(
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
                      SizedBox(
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
                              if (!value.contains('@')) {
                                return 'Please enter valid email'.tr;
                              }

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
                      SizedBox(
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
                            onSaved: (newValue) =>
                                controller.newUser!.age = newValue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
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
                      SizedBox(
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
                        onSaved: (newValue) =>
                            controller.newUser!.gender = newValue,
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
                      DropdownButtonFormField<PackageType>(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2282B7)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: 'Select Package Type'.tr,
                          fillColor: Colors.white,
                        ),
                        elevation: 5,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select package type'.tr;
                          }
                          return null;
                        },
                        onChanged: (newValue) {
                          controller.newUser?.packageType = newValue;
                          controller.newUser?.package =
                              (controller.newUser?.packageType ==
                                      PackageType.byPackage)
                                  ? 5
                                  : 50;
                        },
                        onSaved: (newValue) {
                          controller.newUser?.packageType = newValue;
                          controller.newUser?.package =
                              (controller.newUser?.packageType ==
                                      PackageType.byPackage)
                                  ? 5
                                  : 50;
                        },
                        value: controller.newUser
                            ?.packageType, // Add this line to set the initial value
                        items: [
                          DropdownMenuItem<PackageType>(
                            value: PackageType.byPackage,
                            child: Text('By Package'.tr),
                          ),
                          DropdownMenuItem<PackageType>(
                            value: PackageType.byTime,
                            child: Text('By Time'.tr),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Material(
                          elevation: 5,
                          child: TextFormField(
                            obscureText: x!,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      x = !x!;
                                    });
                                  },
                                  child: x!
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
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
                              if (value.length < 8) {
                                return 'please enter atleast 8 chars'.tr;
                              }

                              return null;
                            },
                            onSaved: (newValue) =>
                                controller.password = newValue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
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
                              if (value.length < 8) {
                                return 'please enter atleast 8 chars'.tr;
                              }

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
                      SizedBox(
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
                                controller.newUser!.medicalIssue = newValue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //  const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(color: AppConstants.appColor),
                          ),
                        ),
                        onPressed: controller.createAccount,
                        child: Text(
                          'Create New Account'.tr,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: AppConstants.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(color: AppConstants.appColor),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => const SignInScreen1(),
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 500),
                              transition: Transition.native);
                        },
                        child: Text('Sign in'.tr),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
