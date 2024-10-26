import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackhthon_project/views/authentication/login/login_view.dart';
import 'package:hackhthon_project/views/home/home_view.dart';
import 'auth_controller.dart';

class AuthGate extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authController.user.value == null) {
        return LoginView();
      } else {
        return HomeView();
      }
    });
  }
}
