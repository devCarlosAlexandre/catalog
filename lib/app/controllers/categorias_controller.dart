import 'package:get/get.dart';

import '../models/categoria_model.dart';
import '../repositories/categoria_repository.dart';

class CategoriaController extends GetxController {
  final repository = CategoriaRepository();

  RxList<CategoriaModel> listCategorias = RxList<CategoriaModel>([]);
  RxBool isLoading = false.obs;

  Future getCategorias() async {
    isLoading.value = true;
    List<CategoriaModel> result = await repository.getAll();
    if (result.isNotEmpty) {
      listCategorias.assignAll(result);
    } else {
      print("Erro ao retornar os dados");
    }
    isLoading.value = false;
  }
}