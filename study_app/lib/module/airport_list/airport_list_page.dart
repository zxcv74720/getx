import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/module/airport_list/airport_list_controller.dart';

class AirportListPage extends StatelessWidget {
  const AirportListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AirportListController.to;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: const Text('Airport Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.setAirportList();
        },
        child: Obx(() {
          if (controller.airportList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              controller: controller.scrollController,
              itemCount: controller.airportList.length,
              itemBuilder: (BuildContext context, int index) {
                final airport = controller.airportList[index];
                return SizedBox(
                  height: 50,
                  child: Center(
                    child: Text('${airport.name} | ${airport.municipality}'),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          }
        }),
      ),
    );
  }
}
