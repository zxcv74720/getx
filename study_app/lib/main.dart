import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:study_app/route/app_pages.dart';
import 'package:study_app/route/app_routes.dart';

import 'module/main/main_controller.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final mainController = Get.put(MainController());
  final bool isUserLoggedIn = await mainController.isUserLoggedIn();
  Logger().i('isUserLoggedIn: $isUserLoggedIn');

  FlutterNativeSplash.remove();
  runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isUserLoggedIn});

  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Study App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      getPages: AppPages.routes,
      initialRoute: isUserLoggedIn ? AppRoutes.home : AppRoutes.sign,
    );
  }
}
