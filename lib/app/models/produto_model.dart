//import 'package:catalog/app/models/categoria_model.dart';
//import 'package:catalog/app/models/comentario_model.dart';
import 'dart:convert';

class ProdutoModel{
   int? id;
  int? userId;
  String? userName;
  int? categoriaId;
  String? name;
  String? imagem;
  DateTime? createdAt;
 ProdutoModel({
    this.id,
    this.userId,
    this.userName,
    this.categoriaId,
    this.name,
    this.imagem,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'categoriaId': categoriaId,
      'name': name,
      'imagem': imagem,
      
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'],
      userId: map['user_id'],
      userName: map['user_name'],
      categoriaId: map['categoria_id'],
      name: map['name'],
      
      imagem: map['photo_path'],
      
    );
  }

  static List<ProdutoModel> fromList(list) {
    return List<ProdutoModel>.from(list.map((x) =>ProdutoModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>ProdutoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProdutoModel(id: $id, userId: $userId, userName: $userName, categoriaId: $categoriaId, name: $name, imagem: $imagem, )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProdutoModel &&
        other.id == id &&
        other.userId == userId &&
        other.userName == userName &&
        other.categoriaId == categoriaId &&
        other.name == name &&
        other.imagem == imagem; 
        
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ userName.hashCode ^ categoriaId.hashCode ^ name.hashCode ^ imagem.hashCode ;
}

}