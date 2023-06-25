import 'package:catalog/app/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../repositories/user_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileRepository(httpManager: Get.find()));
    Get.put(ProfileController(
        appUtils: Get.find(), auth: Get.find(), repository: Get.find()));
  }
}
