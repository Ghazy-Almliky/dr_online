import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';
import 'add_doctor_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userType;
  HomeScreen({super.key, required this.userType});

  final DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Get.updateLocale(
                Get.locale?.languageCode == 'ar'
                    ? const Locale('en', 'US')
                    : const Locale('ar', 'YE'),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            _buildHeader(),
            _buildDrawerItem('all'.tr, Icons.grid_view, 'all'),
            _buildDrawerItem('dentist'.tr, Icons.health_and_safety, 'dentist'),
            _buildDrawerItem('eyes'.tr, Icons.remove_red_eye, 'eyes'),
            _buildDrawerItem('internal'.tr, Icons.medical_services, 'internal'),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.orange),
              title: Text('about_dev'.tr),
              onTap: () => Get.to(() => const AboutScreen()),
            ),
          ],
        ),
      ),
      floatingActionButton: (userType == "طبيب" || userType == "مستشفى")
          ? FloatingActionButton.extended(
              onPressed: () => Get.to(() => const AddDoctorScreen()),
              label: Text('add_doctor'.tr),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.blueAccent,
            )
          : null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: (v) => controller.searchQuery.value = v,
              decoration: InputDecoration(
                hintText: 'search_hint'.tr,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final docs = controller.filteredDoctors;
              if (docs.isEmpty) {
                return Center(child: Text('no_data'.tr));
              }
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      onTap: () => controller.bookDoctor(doc),
                      leading: CircleAvatar(
                        radius: 30,
                        // الحل الجديد هنا
                        backgroundColor: Colors.blue.withValues(alpha: 0.1),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        doc.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${doc.specialty.tr} - ${doc.hospital}"),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Text(" ${doc.rating}"),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${doc.price} ر.ي",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            "حجز موعد",
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, String value) =>
      ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        onTap: () {
          controller.selectedSpecialty.value = value;
          Get.back();
        },
      );

  Widget _buildHeader() => UserAccountsDrawerHeader(
    decoration: const BoxDecoration(color: Colors.blueAccent),
    accountName: Text('app_title'.tr),
    accountEmail: Text(userType),
    currentAccountPicture: const CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(Icons.local_hospital, color: Colors.blueAccent, size: 35),
    ),
  );
}
