import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'sigin_up_screen.dart';
import '../controllers/Sign_In_Controller.dart';

import '../Views/constanst.dart';

class SignInScreen1 extends StatelessWidget {
  const SignInScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Form(
            key: controller
                .key1, // This line will cause an error since controller is not defined.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 60,
                ),

                SvgPicture.asset('assets/Group.svg'),
                SizedBox(height: 10),

                // Image.asset('assets/Group.png'),
                Center(
                  child: Text(
                    'Perry Botros',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Nutritionist',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Email'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppConstants.appColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstants.appFont,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                        hintText: 'email'.tr,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email'.tr;
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email'.tr;
                        }
                        return null;
                      },
                      onSaved: (newValue) => controller.email = newValue!,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Password'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppConstants.appColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstants.appFont,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff2282B7),
                            width: 1.0,
                          ),
                        ),
                        hintText: 'Password'.tr,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password'.tr;
                        }
                        if (value.length < 8) {
                          return 'Please enter at least 8 characters'.tr;
                        }
                        return null;
                      },
                      onSaved: (newValue) => controller.password = newValue!,
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           width: 10,
                //           child: Checkbox(
                //             value: false,
                //             onChanged: (bool? value) {},
                //           ),
                //         ),
                //         SizedBox(width: 20),
                //         // Text(
                //         //   'Remember me',
                //         //   style: TextStyle(
                //         //     fontSize: 12,
                //         //     color: AppConstants.appColor,
                //         //     fontWeight: FontWeight.w600,
                //         //     fontFamily: AppConstants.appFont,
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //     Text(
                //       'Forgot password ?'.tr,
                //       style: TextStyle(
                //         fontSize: 12,
                //         color: Colors.red,
                //         fontWeight: FontWeight.w300,
                //         fontFamily: AppConstants.appFont,
                //       ),
                //     ),
                //   ],
                // ),
                Divider(),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppConstants.appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  onPressed: controller.signIn,
                  child: Text('Sign In'.tr),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: AppConstants.appColor),
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(SignUpScreen());
                  },
                  child: Text(
                    'Create New Account'.tr,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.appColor,
        onPressed: () {
          if (Get.locale!.languageCode == "ar") {
            Get.updateLocale(const Locale("en"));
          } else {
            Get.updateLocale(const Locale("ar"));
          }
        },
        child: Icon(Icons.g_translate),
      ),
    );
  }
}
