import 'package:catalog/app/controllers/produto_controller.dart';
import 'package:catalog/app/core/widgets/produto_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/app_colors.dart';
import '../../core/routes/app_routes_pages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ProdutoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        hoverColor: AppColors.primary,
        onPressed: () async {
          await Get.toNamed(AppRoutes.formProduto);
          // controllerState.getItens();
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getProdutos();
        },
        child: GetX<ProdutoController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.listProduto.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProdutoWidget(
                    imagem: controller.listProduto[index].imagem ?? "",
                    name: controller.listProduto[index].nome ?? "",
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
