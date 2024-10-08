import 'package:get/get.dart';
import 'package:study_app/module/airport_list/airport_list_controller.dart';
import 'package:study_app/module/airport_list/airport_list_page.dart';
import 'package:study_app/module/home/home_page.dart';
import 'package:study_app/module/main/main_controller.dart';
import 'package:study_app/module/sign/sign_controller.dart';
import 'package:study_app/module/sign/sign_page.dart';
import 'package:study_app/module/user_list/user_list_controller.dart';

import '../module/home/home_controller.dart';
import '../module/user_detail/user_detail_controller.dart';
import '../module/user_detail/user_detail_page.dart';
import '../module/user_list/user_list_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.sign,
      page: () => const SignPage(),
      binding: BindingsBuilder(() {
        Get.put(SignController());
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(UserListController());
        Get.put(AirportListController());
      }),
    ),
    GetPage(
      name: AppRoutes.userList,
      page: () => const UserListPage(),
      binding: BindingsBuilder(() {
        Get.put(UserListController());
      }),
    ),
    GetPage(
      name: AppRoutes.userDetail,
      page: () => const UserDetailPage(),
      binding: BindingsBuilder(() {
        Get.put(UserDetailController(),
          tag: Get.parameters['id'] ?? '-1',
        );
      }),
      parameters: const {
        'id': '-1',
      }
    ),
    GetPage(
      name: AppRoutes.airportList,
      page: () => const AirportListPage(),
      binding: BindingsBuilder(() {
        Get.put(AirportListController());
      }),
    ),
  ];
}