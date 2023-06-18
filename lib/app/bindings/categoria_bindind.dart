import 'package:get/get.dart';

import '../controllers/categoria_controller.dart';
import '../repositories/categoria_repository.dart';

class CategoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoriaRepository(httpManager: Get.find()));
    Get.put(CategoriaController(auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}