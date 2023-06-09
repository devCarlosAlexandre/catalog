import 'package:catalog/app/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    controller.getUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: GetX<UserController>(
        builder: (_) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) => ListTile(
                      title: Text(controller.listUsers[index].name ?? ""),
                      subtitle: Text(controller.listUsers[index].email ?? ""),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.listUsers.length);
          }
        },
      ),
    );
  }
}