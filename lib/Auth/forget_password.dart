import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    void restPasswrod() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: controller.text);
        Get.snackbar('Password Reset'.tr,
            'An Email Has been send to your email to reset the Password '.tr,
            backgroundColor: Colors.greenAccent,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.black);
      } on FirebaseAuthException catch (e) {
        print(e.message);
        Get.snackbar('Warrning'.tr, e.message!.tr,
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.BOTTOM);
      }
      controller.text = '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Password Reset'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth > 500 ? 400 : double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    child: Material(
                      elevation: 5,
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff2282B7),
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Email'.tr,
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        restPasswrod();
                      },
                      child: Text('Reset Password'.tr))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
