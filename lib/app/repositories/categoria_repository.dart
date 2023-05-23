import 'package:catalog/app/core/services/http_manager.dart';

import '../models/categoria_model.dart';

class CategoriaRepository {
  HttpManager httpManager = HttpManager();

  Future<List<CategoriaModel>> getAll() async {
    final response = await httpManager.request(
      url: "https://catalog.appke.com.br/api/categories",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<CategoriaModel> categoryList = CategoriaModel.fromList(list);

      return categoryList;
    } else {
      return [];
    }
  }

  Future<CategoriaModel> getById(int id) async {
    CategoriaModel model = CategoriaModel();

    final response = await httpManager.request(
      url: "https://catalog.appke.com.br/api/categories/$id",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      model = CategoriaModel.fromJson(response['data']);
    }

    return model;
  }
}