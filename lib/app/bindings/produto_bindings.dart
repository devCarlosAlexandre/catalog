import 'package:get/get.dart';

import '../controllers/produto_controller.dart';
import '../repositories/produto_repository.dart';

class ProdutoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProdutoRepository(httpManager: Get.find()));
    Get.put(ProdutoController(
        appUtils: Get.find(), auth: Get.find(), repository: Get.find()));
  }
}

