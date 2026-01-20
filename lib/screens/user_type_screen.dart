import 'package:flutter/material.dart';
import 'login_screen.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_hospital, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              "DrOnline",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            _buildTypeButton(context, "زائر / مريض", Icons.person, "مريض"),
            _buildTypeButton(context, "طبيب", Icons.medical_services, "طبيب"),
            _buildTypeButton(
              context,
              "إدارة مستشفى",
              Icons.apartment,
              "مستشفى",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeButton(
    BuildContext context,
    String title,
    IconData icon,
    String type,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        icon: Icon(icon, color: Colors.blueAccent),
        label: Text(
          title,
          style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(userType: type),
            ),
          );
        },
      ),
    );
  }
}
