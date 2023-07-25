import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enKeys,
        'ar': arKeys,
      };
}

Map<String, String> get arKeys => {
      'hello': 'مرحبا',
      'Please enter age': 'الرجاء ادخال العمر',
      'Please enter email': 'الرجاء ادخال الايميل',
      'Please enter your age': 'الرجاء ادخال العمر',
      'Please enter Height': 'الرجاء ادخال الطول',
      'Please select you gender': 'الرجاء اختيار النوع',
      'Select Gender': 'اختار النوع',
      'Please enter password': 'الرجاء ادخال كلمة السر',
      'Please enter phone': 'الرجاء ادخال رقم الهاتف',
      'please enter atleast 8 chars': 'الرجاء ادخال8 حروف على الاقل',
      'if You have any medical issue please write it down':
          'الرجاء كتابة المشاكل الصحية',
      'Password': 'كلمة السر',
      'Go to Statemnst page': 'الذهاب الى صفحة الاشعارات',
      'delete date': 'حذف الموعد',
      'Gender': 'النوع',
      'Edit Weight': 'تعديل الوزن',
      'Post Statment': 'عمل اشعار',
      'Cancel': 'الغاء',
      'Save': 'حفظ',
      'Age': 'العمر',
      'Height': 'الطول',
      'Phone': 'رقم الهاتف',
      'Weight': 'الوزن',
      'Male': 'ذكر',
      'Female': 'انثى',
      'female': 'انثى',
      'medical issue': 'مشاكل صحية',
      'Sign in': 'تسجيل الدخول',
      'Create New Account': 'انشاء حساب جديد',
      'Sign Up': 'انشاء حساب',
      'Name': 'الاسم',
      'Sign In': 'تسجيل الدخول',
      'email': 'ايميل',
      'hello_getx': 'Getx مرحبا',
      'change_lang': 'تغير اللغة',
      'make an appoimnet': 'عمل حجز',
      'View profile': 'فتح الصفحة الشخصية',
      'Select Date': 'اختيار التاريخ',
      'Make Reservation': "عمل حجز",
      'Show Reservations': 'اظهار الحجوزات',
      'Open Google Maps': 'فتح خرائط قوقل',
      'Reservation Screen': 'شاشة الحجز',
      'did not paid': 'لم يدفع',
      'paid': 'دفع'
    };
Map<String, String> get enKeys => {
      'hello': 'Hello',
      'hello_getx': 'Hello Getx',
      'change_lang': 'Change Language',
    };
