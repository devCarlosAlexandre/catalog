import 'dart:convert';

class CategoriaModel {
  int? id;
  String? name;

  CategoriaModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaModel.fromJson(String source) => CategoriaModel.fromMap(json.decode(source));

  static List<CategoriaModel> fromList(list) {
    return List<CategoriaModel>.from(list.map((x) => CategoriaModel.fromMap(x)));
  }

  @override
  String toString() => 'CategoriaModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriaModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}