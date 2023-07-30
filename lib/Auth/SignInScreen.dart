import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappoinmentapp/constants.dart';
import 'package:get/get.dart';

import '../controllers/Sign_In_Controller.dart';
import 'SignUpScreen.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Form(
          key: controller.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                'assets/login_logo.svg',
              ),
              Center(
                child: Text(
                  'Perry Botros',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Nutritionist',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'login',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppConstants.appColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppConstants.appFont),
                ),
              ),
              Text(
                'Email'.tr,
                style: TextStyle(
                    fontSize: 14,
                    color: AppConstants.appColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstants.appFont),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: Center(
                  child: Material(
                    elevation: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff2282B7), width: 1.0),
                          ),
                          hintText: 'email'.tr),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email'.tr;
                        }
                        if (!value.contains('@'))
                          return 'Please enter valid email';

                        return null;
                      },
                      onSaved: (newValue) => controller.email = newValue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password'.tr,
                style: TextStyle(
                    fontSize: 14,
                    color: AppConstants.appColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstants.appFont),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: Material(
                  elevation: 5,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff2282B7), width: 1.0),
                        ),
                        hintText: 'Password'.tr),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        child: CheckboxListTile(
                          selectedTileColor: AppConstants.appColor,
                          checkColor: AppConstants.appColor,
                          value: false,
                          onChanged: (bool? value) {},
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            fontSize: 12,
                            color: AppConstants.appColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppConstants.appFont),
                      ),
                    ],
                  ),
                  Text(
                    'Forget password ?',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w300,
                        fontFamily: AppConstants.appFont),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(AppConstants.appColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                  ),
                ),
                onPressed: controller.signIn,
                child: Text('Sign In'.tr),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: AppConstants.appColor)
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(SignUpScreen());
                },
                child: Text('Create New Account'.tr,style: TextStyle(
                  color: Colors.black
                ),),
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
