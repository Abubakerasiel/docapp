import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterappoinmentapp/Auth/sigin_up_screen.dart';

import 'package:get/get.dart';

import '../Auth/sigin_screen.dart';

import 'about_us.dart';
import 'constanst.dart';

class TermsAndCondtion extends StatefulWidget {
  const TermsAndCondtion({super.key});

  @override
  State<TermsAndCondtion> createState() => _TermsAndCondtionState();
}

class _TermsAndCondtionState extends State<TermsAndCondtion> {
  bool x = true;
  RxString term = ''.obs;
  Future getTerm() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection('terms')
          .doc('BPtaalhXBMhdryhDFKQ2')
          .get();

      term.value = snap.data()!['Terms'];
    } catch (e) {}
  }

  @override
  void initState() {
    getTerm().then((value) {
      setState(() {
        x = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: x
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                              child: Text(
                            'قواعد وشروط المكان ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => Center(
                              child: Text(
                                term.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // Center(
                          //     child: Text(
                          //   'قواعد وشروط المكان ',
                          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          // )),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const Text('الدخول بالميعاد وليس اولوية الحضور',
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const Text('الباكدج',
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     const Text(
                          //         ' ٥٠٠ فى الشهر : مقسمة  مرة فى الاسبوع و صلاحية الباكدج   ',
                          //         maxLines: 2,
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15,
                          //             color: Colors.blueGrey)),
                          //     Text('  لمدة شهر واسبوع و بعد ذلك تعتبر منتهية   ',
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 15,
                          //             color: Colors.blueGrey)),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Text('او بالمرة : ٢٠٠ جنية كل كشف او  متابعة',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 15,
                          //         color: Colors.blueGrey)),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const Text('حجز المعاد من الابليكشن مفتوح قبل المعاد ب اسبوع',
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          const Text(
                              'الاستفسار او الشكوى  برجاء ارساله رساله واتس اب على رقم',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text('01221246631',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            width: constraints.maxWidth > 500
                                ? 400
                                : double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => SignUpScreen1(),
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.native);
                              },
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  side:
                                      BorderSide(color: AppConstants.appColor),
                                ),
                              ),
                              child: Text(
                                'Create New Account'.tr,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: constraints.maxWidth > 500
                                ? 400
                                : double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                primary: AppConstants.appColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  side:
                                      BorderSide(color: AppConstants.appColor),
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    // ignore: deprecated_member_use
                                    primary: AppConstants.appColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      side: BorderSide(
                                          color: AppConstants.appColor),
                                    )),
                                onPressed: () {
                                  Get.to(() => AboutUsPage(),
                                      curve: Curves.easeIn,
                                      duration: Duration(milliseconds: 500),
                                      transition: Transition.native);
                                },
                                child: Text('About Us')),
                          )
                        ],
                      ),
                    ),
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
        child: const Icon(Icons.g_translate),
      ),
    );
  }
}
