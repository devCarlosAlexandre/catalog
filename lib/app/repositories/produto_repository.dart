import 'package:catalog/app/models/produto_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/api_result.dart';
import '../core/utils/urls.dart';

class ProdutoRepository {
  final HttpManager httpManager;

  ProdutoRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<ProdutoModel>>> getAll(String token) async {
    const String endpoint = "${Url.base}/Produtos";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<ProdutoModel> listProdutos = ProdutoModel.fromList(list);

      return ApiResult<List<ProdutoModel>>(data: listProdutos);
    } else {
      String message = response['error'] ?? "Não foi possível buscar os produtos. Tente novamente!";
      return ApiResult<List<ProdutoModel>>(message: message, isError: true);
    }
  }

  Future<ApiResult<ProdutoModel>> getById(String token, int id) async {
    String endpoint = "${Url.base}/Produtos/$id";

    ProdutoModel model = ProdutoModel();

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      model = ProdutoModel.fromJson(response['data']);
      return ApiResult<ProdutoModel>(data: model);
    } else {
      String message = response['error'] ?? "Não foi possível buscar o produto. Tente novamente!";
      return ApiResult<ProdutoModel>(message: message, isError: true);
    }
  }
}