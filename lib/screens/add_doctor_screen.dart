import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';

class AddDoctorScreen extends StatelessWidget {
  const AddDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorController controller = Get.find<DoctorController>();
    final nameController = TextEditingController();
    final specController = TextEditingController();
    final hospController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('add_doctor'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'doctor_name'.tr),
            ),
            TextField(
              controller: specController,
              decoration: InputDecoration(labelText: 'specialty'.tr),
            ),
            TextField(
              controller: hospController,
              decoration: InputDecoration(labelText: 'hospital'.tr),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // استدعاء الدالة بشكل صحيح
                controller.addDoctor(
                  nameController.text,
                  specController.text,
                  hospController.text,
                );
              },
              child: Text('save'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
