import 'dart:convert';

import 'package:get/get.dart';

import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../models/categoria_model.dart';
import '../repositories/categoria_repository.dart';
import 'auth_controller.dart';

 class CategoriaController extends GetxController {
  final AuthController auth;
  final CategoriaRepository repository;
  final AppUtils appUtils;

  CategoriaController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  @override
  void onInit() {
    super.onInit();

    getCategories();
  }

  RxList<CategoriaModel> listCategories = RxList<CategoriaModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;

   ApiResult<List<CategoriaModel>> result = await epository.getAll(auth.user.token!);
    if (!result.isError) {
      listCategories.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}

