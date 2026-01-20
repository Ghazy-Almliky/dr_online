import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/doctor_model.dart';

class DoctorController extends GetxController {
  var allDoctorsRx = <Doctor>[].obs;
  var selectedSpecialty = "all".obs;
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    allDoctorsRx.addAll([
      Doctor(
        name: "د. محمد العامري",
        specialty: "dentist",
        hospital: "مستشفى الأمل",
        price: "5000",
        rating: 4.8,
      ),
      Doctor(
        name: "د. سارة المنصور",
        specialty: "eyes",
        hospital: "مركز الرؤية",
        price: "7000",
        rating: 4.9,
      ),
    ]);
  }

  // هذه هي الدالة التي يطلبها الخطأ
  void addDoctor(String name, String spec, String hosp) {
    allDoctorsRx.add(
      Doctor(
        name: name,
        specialty: spec,
        hospital: hosp,
        price: "6000", // سعر افتراضي بالريال اليمني
        rating: 5.0,
      ),
    );
    Get.back(); // للعودة للخلف بعد الإضافة
    Get.snackbar(
      "نجاح",
      "تمت إضافة الطبيب بنجاح",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void bookDoctor(Doctor doctor) {
    Get.snackbar(
      "حجز موعد",
      "تم حجز موعد مع ${doctor.name}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  List<Doctor> get filteredDoctors {
    return allDoctorsRx.where((doc) {
      bool matchesSpec =
          selectedSpecialty.value == "all" ||
          doc.specialty == selectedSpecialty.value;
      return matchesSpec;
    }).toList();
  }
}
