import 'package:catalog/app/models/categoria_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/categoria_controller.dart';

class CategoriaPage extends StatelessWidget {
  CategoriaPage({super.key});
  final CategoriaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getCategories();
        },
        child: GetX<CategoriaController>(
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(thickness: 1, indent: 16, endIndent: 16),
                itemCount: controller.listCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  CategoriaModel model = controller.listCategories[index];
                  return ListTile(
                    title: Text("${model.name}", style: const TextStyle(fontWeight: FontWeight.w600)),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
