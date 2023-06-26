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
    const String endpoint = "${Url.base}/produto";

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
      String message = response['error'] ??
          "Não foi possível buscar os produtos. Tente novamente!";
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
      String message = response['error'] ??
          "Não foi possível buscar o produto. Tente novamente!";
      return ApiResult<ProdutoModel>(message: message, isError: true);
    }
  }

  Future<ApiResult<ProdutoModel>> createProduto(
      {required String token,
      required String name,
      required int user_id,
      required int category_id,
      required String titulo,
      required String descricao,
      required String content,
      required num preco}) async {
    String endpoint = "${Url.base}/produto";

    final response = await httpManager
        .request(url: endpoint, method: HttpMethods.post, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "user_id": user_id,
      "categoria_id": category_id,
      "title": titulo,
      "content": content,
      "photo_path": "",
      "valor": preco,
      "descricao": descricao,
      "nome": name,
    });

    if (response['data'] != null) {
      ProdutoModel itens = ProdutoModel.fromMap(response['data']);
      return ApiResult<ProdutoModel>(data: itens);
    } else {
      String message =
          response['error'] ?? "Error ao criar produto Tente novamente!";
      return ApiResult<ProdutoModel>(message: message, isError: true);
    }
  }
}
