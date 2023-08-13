import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Auth/sigin_up_screen.dart';
import 'package:get/get.dart';

import '../Auth/sigin_screen.dart';
import 'constanst.dart';

class TermsAndCondtion extends StatelessWidget {
  const TermsAndCondtion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'قواعد وشروط المكان ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
              const SizedBox(
                height: 20,
              ),
              const Text('الدخول بالميعاد وليس اولوية الحضور',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                height: 20,
              ),
              const Text('الباكدج',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                      '٥٠٠ فى الشهر : مقسمة  مرة فى الاسبوع و صلاحية الباكدج لمدة  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey)),
                  Text('شهر واسبوع و بعد ذلك تعتبر منتهية',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text('او بالمرة : ٢٠٠ جنية كل كشف او  متابعة',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blueGrey)),
              const SizedBox(
                height: 20,
              ),
              const Text('حجز المعاد من الابليكشن مفتوح قبل المعاد ب اسبوع',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  ' الاستفسار او الشكوى ب برجاء ارساله رساله واتس اب على رقم ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text('01221246631',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(SignUpScreen(),
                            curve: Curves.easeInOut,
                            duration: Duration(seconds: 1),
                            transition: Transition.fadeIn);
                      },
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          side: BorderSide(color: AppConstants.appColor),
                        ),
                      ),
                      child: Text(
                        'Create New Account'.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
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
                        Get.to(const SignInScreen1(),
                            curve: Curves.easeInOut,
                            duration: Duration(seconds: 1),
                            transition: Transition.fadeIn);
                      },
                      child: Text('Sign in'.tr),
                    ),
                  ),
                ],
              ),
            ],
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
        child: const Icon(Icons.g_translate),
      ),
    );
  }
}
