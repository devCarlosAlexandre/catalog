import '../core/services/http_manager.dart';
import '../core/utils/api_result.dart';
import '../core/utils/urls.dart';
import '../models/categoria_model.dart';

class CategoriaRepository {
  final HttpManager httpManager;

  CategoriaRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<CategoriaModel>>> getAll(String token) async {
    const String endpoint = "${Url.base}/categories";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<CategoriaModel> categoriaList = CategoriaModel.fromList(list);

      return ApiResult<List<CategoriaModel>>(data: categoriaList);
    } else {
      String message = response['error'] ??
          "Não foi possível buscar as categorias. Tente novamente!";
      return ApiResult<List<CategoriaModel>>(message: message, isError: true);
    }
  }

  Future<ApiResult<CategoriaModel>> getById(String token, int id) async {
    String endpoint = "${Url.base}/categories/$id";

    CategoriaModel model = CategoriaModel();

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      model = CategoriaModel.fromJson(response['data']);
      return ApiResult<CategoriaModel>(data: model);
    } else {
      String message = response['error'] ??
          "Não foi possível buscar a categoria. Tente novamente!";
      return ApiResult<CategoriaModel>(message: message, isError: true);
    }
  }
}
