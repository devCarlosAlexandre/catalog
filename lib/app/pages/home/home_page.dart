import 'package:catalog/app/controllers/produto_controller.dart';
import 'package:catalog/app/core/widgets/produto_widget.dart';
import 'package:catalog/app/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final ProdutoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
                  ProdutoModel model = controller.listProduto[index];

                 return ProdutoWidget(model: model);
                },
              );
            }
          },
        ),
      ),
    );
  } 
}