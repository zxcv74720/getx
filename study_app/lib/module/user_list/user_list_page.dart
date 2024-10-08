import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/module/user_list/user_list_controller.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserListController.to;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.setUserList();
        },
        child: Obx(() {
          if (controller.userList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              controller: controller.scrollController,
              itemCount: controller.userList.length,
              itemBuilder: (BuildContext context, int index) {
                final user = controller.userList[index];
                return SizedBox(
                  height: 50,
                  child: Center(
                    child: Text('${user.firstName} ${user.lastName}'),
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
