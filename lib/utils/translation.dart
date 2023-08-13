import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enKeys,
        'ar': arKeys,
      };
}

Map<String, String> get arKeys => {
      'Name :': 'الاسم',
      'Phone :': 'رقم التلفون',
      'Age :': 'العمر',
      'Height :': 'الطول',
      'Gender :': 'النوع',
      'Weight :': 'الوزن',
      'Medical Issue :': 'المشاكل الصحية',
      'Package Type :': 'نوع الباكدج',
      'weight update': 'تعديل الزون',
      'weight updated successulfy ': 'تم تعديل الوزن بنجاح',
      'the weight did not update': 'لم يتم تعديل الوزن',
      'Select Package Type': 'اختار نوع الباكدج',
      'Please select package type': 'الرجاء اختيار نوع الباكدج',
      'By Package': 'بالباكدج',
      'By Time': 'بالمرة',
      'Please Select A Date': 'الرجاء اختيار تاريخ',
      'The Day is off': 'اليوم اجازة',
      'Please Select Another day': 'الرجاء اختيار يوم آخر',
      'Please Select A Day from Saturday To Tuesday':
          'الرجاء اختيار يوم من الأحد إلى الثلاثاء',
      'Your appointment is coming up in 24 hours':
          'تذكير موعدك بعد ٢٤ ساعة من الان',
      'booking Reminder': 'تذكير بالحجز',
      'Deleting Not Allowed': 'غير مسموح بالالغاء',
      'Cannot delete appointment less than 24 hours away.':
          'غير مسموح الغاء الموعد في أقل من ٢٤ ساعة من تاريخ الموعد',
      'Hello  Your appointment is coming up in 24 hours.':
          'تذكير موعدك بعد ٢٤ ساعة من الان',
      'Sorry, no available appointments on this day. You have been added to the waiting list.':
          'عفوا لا يوجد مواعيد متاحة في هذا اليوم تم اضافتك إلى قائمة الانتظار',
      'Wrong Date': 'تاريخ خطأ',
      'Cancel Date': 'إلغاء الموعد',
      'Login': 'تسجيل الدخول',
      'Dates Page': 'صفحة المواعيد',
      'Booking Date': ":تاريخ الحجز",
      'Booking Time': ':زمن الحجز',
      'Confirm Booking': 'تأكيد الحجز',
      'Home': 'الصفحة الرئيسية',
      'Booking Page': 'صفحة الحجز',
      'Profile Page': 'الصفحة الشخصية',
      "Remember , you deserve to be the best version of yourself.":
          'افتكر، انت تستحق انك تكون افضل نسخه منك',
      "Everyday is a start day, don't give up.":
          'كل يوم هو بداية جديدة، ماتستسلمش',
      "Failure is a phase, not a final result.":
          'الفشل مرحلة ، وليس النتيجة النهائيه',
      "10- grams loss, is a success.": 'خسيت ١٠ جرام، ده نجاح.',
      'hello': 'مرحبا',
      'Email': 'ايميل',
      'email': 'ايميل',
      'Full Name': 'الاسم بالكامل',
      'Please enter full name': 'الرجاء إدخال الاسم كامل',
      'Please enter age': 'الرجاء ادخال العمر',
      'Please enter email': 'الرجاء ادخال الايميل',
      'Please enter valid email': 'الرجاء إدخال ايميل صحيح',
      'Please enter weight': 'الرجاء ادخل الوزن',
      'Please enter your age': 'الرجاء ادخال العمر',
      'Please enter Height': 'الرجاء ادخال الطول',
      'Please select you gender': 'الرجاء اختيار النوع',
      'Select Gender': 'اختار النوع',
      'Please enter password': 'الرجاء ادخال كلمة السر',
      'Please enter phone number': 'الرجاء ادخال رقم الهاتف',
      'please enter atleast 8 chars': 'الرجاء ادخال8 حروف على الاقل',
      'if You have any medical issue please write them down if not write none':
          'إذا كان لديك مشاكل صحية الرجاء قم كتابتهم اذا لم يكن هناك مشاكل صحية اكتب لا يوجد',
      'Medical Issue   if you dont have any Write None':
          'المشاكل الصحية اذا لم يكن لديك مشاكل صحية اكتب لا يوجد',
      'Password': 'كلمة السر',
      'Forgot password ?': 'نسيت كلمة المرور؟',
      'Go to Statemnst page': 'الذهاب الى صفحة الاشعارات',
      'delete date': 'حذف الموعد',
      'Gender': 'النوع',
      'Edit Weight': 'تعديل الوزن',
      'Post Statment': 'عمل اشعار',
      'Cancel': 'الغاء',
      'Save': 'حفظ',
      'Age': 'العمر',
      'Height': 'الطول',
      'Phone Number': 'رقم الهاتف',
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
      'hello_getx': 'Getx مرحبا',
      'change_lang': 'تغير اللغة',
      'make an appoimnet': 'عمل حجز',
      'View profile': 'فتح الصفحة الشخصية',
      'Select Date': 'اختيار التاريخ',
      'Make Reservation': "عمل حجز",
      'Show Reservations': 'اظهار الحجوزات',
      'Open Google Maps': 'فتح خرائط قوقل',
      'Reservation Screen': 'شاشة الحجز',
      'Did Not Pay For The Package': 'لم يدفع',
      'Paid For The Package': 'دفع',
      'Package Reminder Update': 'تذكير بالدفع',
      'Hello please  pay  for your pakacge.': 'الرجاء مراجعة السكرتيرة للدفع',
      'Annoucement Update': 'اشعار جديد',
      'An Annoucemnet has been made please sigin to see it ':
          'الرجاء الدخول لرؤية الأشعار',
      'Reservation Update': 'تذكير بالحجز',
      'Hello  You have been assigned an appointment slot.': 'تم تأكيد حجزك',
      'Upcoming Appointment': 'الميعاد القادم',
      'Hello Your appointment is scheduled for tomorrow.':
          'لقد تم حجز موعدك لبكرة',
      'Hello  Your appointment is scheduled for today.':
          'لقد تم حجز موعدك لليوم',
      'Reservation Reminder': 'تذكير بالحجز',
      'Waiting List': 'قائمة الانتظار',
      'Sorry, no available appointments. You have been added to the waiting list.':
          'لا يوجد مواعيد متاحة للحجز تم اضافتك إلى قائمة الانتظار',
      'Waiting List Full': 'قائمة الانتظار ممتلئة',
      'Sorry, no available appointments. The waiting list for this date is already full..':
          'قائمة الانتظار ممتلئة الرجاء حجز تاريخ اخر',
      'Multiple Bookings Not Allowed': 'غير مسموح الحجز اكتر من مرة',
      'You have already booked an appointment on the waiting list.': '',
      'Time Slot Not Available': 'زمن الحجز غير متاح',
      'The selected time slot is already booked.': 'زمن الحجز غير متاح',
      'Please select a future date and time.': '',
      'You have already booked an appointment on the selected date.':
          'لقد تم الحجز مسبقا في نفس اليوم',
      'Successful booking': 'تأكيد حجز',
      'You have successfully booked your appointment': 'تم الحجز بنجاح',
      'Hello  You have been added to the waiting list.':
          'تم اضافتك إلى قائمة الانتظار',
      'Invalid date': 'تاريخ غير صالح',
      'Please select a date from Saturday to tuesday.':
          'الرجاء اختيار اليوم من السبت إلى الثلاثاء',
      'Invalid Time': 'زمن غير صالح',
      'Please choose the time: Saturday 12 am to 7:30 pm, Sunday 5:00 pm to 8:00 pm, Monday and Tuesday, 4:00 pm to 8:30 pm.':
          'الرجاء اختيار الزمن يوم السبت ١٢ صباحا إلى ٧ ونص مساء يوم الاحد من ٥ مساء لي ٨ مساء يوم الاثنين والثلاثاء من ٤ مساء إلى ٨ ونص مساء',
    };
Map<String, String> get enKeys => {
      'hello': 'Hello',
      'hello_getx': 'Hello Getx',
      'change_lang': 'Change Language',
    };
