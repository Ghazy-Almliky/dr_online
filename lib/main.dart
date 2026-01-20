import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/messages.dart';
import 'screens/user_type_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: const Locale('ar', 'YE'),
      fallbackLocale: const Locale('en', 'US'),
      home: const UserTypeScreen(),
    ),
  );
}
