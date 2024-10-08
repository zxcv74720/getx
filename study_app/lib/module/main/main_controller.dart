import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';
import '../../service/user_service.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final UserService userService = UserService();

  final Rxn<User> _user = Rxn<User>();
  final RxBool displayedOnboard = false.obs;

  void setUser(User user) {
    _user.value = user;
  }

  void logout(){
    _user.value = null;
  }

  Future<bool> isUserLoggedIn() async {
    final preferences= await SharedPreferences.getInstance();

    final String? user = preferences.getString('user');
    if (user != null) {
      _user.value = User.fromJson(json.decode(user));
      return true;
    }
    return false;
  }
}