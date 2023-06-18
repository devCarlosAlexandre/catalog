import 'package:catalog/app/controllers/produto_controller.dart';
import 'package:catalog/app/repositories/produto_repository.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../repositories/auth_repository.dart';
import '../core/services/http_manager.dart';
import '../core/utils/app_utils.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpManager());
    Get.put(AppUtils()); 

    Get.put(AuthRepository(httpManager: Get.find(), appUtils: Get.find()));
    Get.put(AuthController(repository: Get.find(), appUtils: Get.find())); 
    Get.put(ProdutoRepository(httpManager: Get.find(), appUtils: Get.find())); 
  
   Get.lazyPut(() => ProdutoController(appUtils: Get.find(), auth: Get.find(), repository: Get.find())); 
  
  }
}
