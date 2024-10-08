import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../route/app_routes.dart';
import '../../service/user_service.dart';

class SignController extends GetxController {
  static SignController get to => Get.find();

  final UserService userService = UserService();
  final TextEditingController idTextController = TextEditingController();

  void login() async {
    final user = await userService.getUser(int.parse(idTextController.text));
    if (user != null) {
      final preferences = await SharedPreferences.getInstance();
      preferences.setString('user', json.encode(user.toJson()));
      Get.offNamed(AppRoutes.userList);
    } else {
      Get.snackbar(
        'Login Failed',
        'User not found',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void dispose() {
    idTextController.dispose();
    super.dispose();
  }
}