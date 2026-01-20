import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade400],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/1.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              "غازي المليكي",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const Text(
                    "حقوق الطبع والنشر © 2026",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "جميع الحقوق محفوظة لتطبيق دكتور أونلاين",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("العودة"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
