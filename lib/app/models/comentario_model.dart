import 'package:catalog/app/models/produto_model.dart';
import 'package:catalog/app/models/user_model.dart';

class Comentario{
  int?id; 
  String? texto; 
  UserModel? user;
  ProdutoModel?produto;
}