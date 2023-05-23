import 'package:get/get.dart';

import '../models/categoria_model.dart';
import '../repositories/categoria_repository.dart';

class CategoryController extends GetxController {
  final repository = CategoriaRepository();

  RxList<CategoriaModel> listCategories = RxList<CategoriaModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;
    List<CategoriaModel> result = await repository.getAll();
    if (result.isNotEmpty) {
      listCategories.assignAll(result);
    } else {
      print("Erro ao retornar os dados");
    }
    isLoading.value = false;
  }
}