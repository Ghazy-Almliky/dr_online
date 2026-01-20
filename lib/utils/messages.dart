import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_title': 'DrOnline',
      'search_hint': 'Search for doctor...',
      'add_doctor': 'Add New Doctor',
      'about_dev': 'About Designer',
      'all': 'All',
      'dentist': 'Dentist',
      'eyes': 'Eyes',
      'internal': 'Internal',
      'no_data': 'No doctors found',
    },
    'ar_YE': {
      'app_title': 'دكتور أونلاين',
      'search_hint': 'ابحث عن طبيب...',
      'add_doctor': 'إضافة طبيب جديد',
      'about_dev': 'عن المصمم',
      'all': 'الكل',
      'dentist': 'أسنان',
      'eyes': 'عيون',
      'internal': 'باطنة',
      'no_data': 'لا يوجد أطباء حالياً',
    },
  };
}
