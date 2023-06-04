import 'package:catalog/app/models/user_model.dart';
import 'package:catalog/app/repositories/user_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class UserController extends GetxController {
  final user = UserRepository();
  RxList<UserModel> listUsers = RxList<UserModel>([]);
  RxBool isLoading = false.obs;

  Future getUsers() async {
    isLoading.value = true;
    List<UserModel> result = await user.getAll();
    if (result.isNotEmpty) {
      listUsers.assignAll(result);
    } else {
      print("Erro ao retornar usuarios");
    }
    isLoading.value = false;
  }
}