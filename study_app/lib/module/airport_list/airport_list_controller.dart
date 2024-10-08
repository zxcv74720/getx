import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:study_app/model/airport.dart';

import '../../service/airport_service.dart';

class AirportListController extends GetxController {
  static AirportListController get to => Get.find();

  final AirportService airportService = AirportService();
  final RxList<Airport> airportList = <Airport>[].obs;
  final RxInt cursorId = 0.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    setAirportList();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        moreAirportList();
      }
    });
  }

  void setAirportList() async {
    final response = await airportService.getAirportList(null, null);
    airportList.value = response?.data ?? [];
    cursorId.value = response?.cursorId ?? 0;
    Logger().i('setAirportList ---> cursorId: ${cursorId.value}');
  }

  void moreAirportList() async {
    final response = await airportService.getAirportList(cursorId.value, null);
    airportList.addAll(response?.data ?? []);
    cursorId.value = response?.cursorId ?? 0;
    Logger().i('moreAirportList ---> cursorId: ${cursorId.value}');
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}