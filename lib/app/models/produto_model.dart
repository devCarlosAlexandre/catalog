import 'dart:convert';

class ProdutoModel {
  int? id;
  int? user_id;
  String? userName;
  int? categoriaId;
  String? nome;
  String? imagem;
  DateTime? createdAt;
  ProdutoModel({
    this.id,
    this.user_id,
    this.userName,
    this.categoriaId,
    this.nome,
    this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'userName': userName,
      'categoriaId': categoriaId,
      'nome': nome,
      'imagem': imagem,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'],
      user_id: map['user_id'],
      userName: map['user_name'],
      categoriaId: map['categoria_id'],
      nome: map['nome'],
      imagem: map['imagem'],
    );
  }

  static List<ProdutoModel> fromList(list) {
    return List<ProdutoModel>.from(list.map((x) => ProdutoModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProdutoModel(id: $id, user_id: $user_id, userName: $userName, categoriaId: $categoriaId, nome: $nome, imagem: $imagem, )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProdutoModel &&
        other.id == id &&
        other.user_id == user_id &&
        other.userName == userName &&
        other.categoriaId == categoriaId &&
        other.nome == nome &&
        other.imagem == imagem;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        userName.hashCode ^
        categoriaId.hashCode ^
        nome.hashCode ^
        imagem.hashCode;
  }
}
