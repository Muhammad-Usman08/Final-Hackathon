import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/views/menu_screen/menu_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MenuScreenView(),
    );
  }
}
