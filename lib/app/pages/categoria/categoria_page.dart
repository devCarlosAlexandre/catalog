import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/categorias_controller.dart';

class CategoriaPage extends StatelessWidget {
  CategoriaPage({super.key});
  final controller = Get.put(CategoriaController());

  @override
  Widget build(BuildContext context) {
    controller.getCategorias();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categoria'),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                  child: ListTile(
                      title: Text(
                controller.listCategorias[index].name ?? "",
              ))),
              itemCount: controller.listCategorias.length,
            );
          }
        }));
  }
}