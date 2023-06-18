import 'package:catalog/app/models/produto_model.dart';
import 'package:catalog/app/repositories/produto_repository.dart';
import 'package:get/get.dart';

import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';


import 'auth_controller.dart';

class ProdutoController extends GetxController {
  final AuthController auth;
  final ProdutoRepository repository;
  final AppUtils appUtils;

  ProdutoController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  @override
  void onInit() {
    super.onInit();

    getProdutos();
  }

  RxList<ProdutoModel> listProduto = RxList<ProdutoModel>([]);
  RxBool isLoading = false.obs;

  Future getProdutos() async {
    isLoading.value = true;

    ApiResult<List<ProdutoModel>> result = await repository.getAll(auth.user.token!);
    if (!result.isError) {
      listProduto.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}