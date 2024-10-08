import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../model/user.dart';
import '../../service/user_service.dart';

class UserListController extends GetxController {
  static UserListController get to => Get.find();

  final UserService userService = UserService();
  final RxList<User> userList = <User>[].obs;
  final RxInt cursorId = 0.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    setUserList();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        moreUserList();
      }
    });
  }

  void setUserList() async {
    final response = await userService.getUserList(null, null);
    userList.value = response?.data ?? [];
    cursorId.value = response?.cursorId ?? 0;
    Logger().i('setUserList ---> cursorId: ${cursorId.value}');
  }

  void moreUserList() async {
    final response = await userService.getUserList(cursorId.value, null);
    userList.addAll(response?.data ?? []);
    cursorId.value = response?.cursorId ?? 0;
    Logger().i('moreUserList ---> cursorId: ${cursorId.value}');
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}